<?php
// =====================================================================
// Services : referentiel unifie depuis la fusion des deux bases.
//
// La table `services` sert desormais deux usages :
//   - le back-office, qui rattache des courses a un service ;
//   - le site vitrine, qui affiche des cartes de presentation.
// Le drapeau `is_operational` distingue les deux. Seuls les services
// operationnels (transport, livraison, restauration) portent des courses ;
// les autres (shopping, paiement, plus-de-services) sont des cartes.
//
// Par defaut ce controleur ne renvoie que les services operationnels :
// c'est ce que le back-office voyait avant la fusion, et cela empeche de
// rattacher une course a une carte purement marketing. `?tous=1` expose
// le referentiel complet.
// =====================================================================

class ServicesController
{
    // Le back-office est monolingue : un libelle saisi ici est ecrit en
    // francais et en anglais, faute de mieux.
    private function bilingue(string $texte): string
    {
        return json_encode(['fr' => $texte, 'en' => $texte], JSON_UNESCAPED_UNICODE);
    }

    private function slugify(string $texte): string
    {
        $slug = iconv('UTF-8', 'ASCII//TRANSLIT//IGNORE', $texte) ?: $texte;
        $slug = strtolower(preg_replace('/[^a-zA-Z0-9]+/', '-', $slug) ?: '');
        return trim($slug, '-') ?: 'service';
    }

    private function presente(array $r): array
    {
        return [
            'id'             => (int) $r['id'],
            'slug'           => $r['slug'],
            'nom_service'    => $r['nom_service'],
            'description'    => $r['description_metier'],
            'actif'          => (bool) $r['is_active'],
            'is_operational' => (bool) $r['is_operational'],
        ];
    }

    private function find($id): ?array
    {
        $stmt = Database::pdo()->prepare(
            'SELECT id, slug, nom_service, description_metier, is_active, is_operational
               FROM services WHERE id = ? LIMIT 1'
        );
        $stmt->execute([$id]);
        $row = $stmt->fetch();
        return $row ?: null;
    }

    public function index(Request $req): void
    {
        $where = $req->queryParam('tous') ? '1 = 1' : 'is_operational = 1';
        if (($actif = $req->queryParam('actif')) !== null && $actif !== '') {
            $where .= ' AND is_active = ' . ((int) (bool) $actif);
        }

        $rows = Database::pdo()->query(
            "SELECT id, slug, nom_service, description_metier, is_active, is_operational
               FROM services WHERE $where ORDER BY nom_service ASC"
        )->fetchAll();

        Response::ok(array_map(fn ($r) => $this->presente($r), $rows));
    }

    public function show(Request $req, array $params): void
    {
        $r = $this->find($params['id']);
        if (!$r) {
            Response::error('Service introuvable.', 404);
        }
        Response::ok($this->presente($r));
    }

    public function store(Request $req): void
    {
        Auth::requireSuperAdmin($req);
        $b = $req->body();
        if (empty($b['nom_service'])) {
            Response::error('Champ obligatoire manquant : nom_service', 422);
        }

        $now = date('Y-m-d H:i:s');
        try {
            $stmt = Database::pdo()->prepare(
                'INSERT INTO services
                    (slug, title, description, icon, position, is_active, is_operational, description_metier, created_at, updated_at)
                 VALUES (?,?,?,?,(SELECT COALESCE(MAX(position),0)+1 FROM services s2),?,1,?,?,?)'
            );
            $stmt->execute([
                $b['slug'] ?? $this->slugify($b['nom_service']),
                $this->bilingue($b['nom_service']),
                $this->bilingue((string) ($b['description'] ?? $b['nom_service'])),
                $b['icon'] ?? 'grid',
                array_key_exists('actif', $b) ? (int) (bool) $b['actif'] : 1,
                $b['description'] ?? null,
                $now, $now,
            ]);
        } catch (PDOException $e) {
            $msg = ($e->errorInfo[1] ?? 0) === 1062
                ? 'Doublon : ce service existe deja.'
                : 'Creation impossible : donnees invalides.';
            Response::error($msg, 422);
        }

        Response::ok($this->presente($this->find(Database::pdo()->lastInsertId())), 201);
    }

    public function update(Request $req, array $params): void
    {
        Auth::requireSuperAdmin($req);
        if (!$this->find($params['id'])) {
            Response::error('Service introuvable.', 404);
        }

        $b   = $req->body();
        $set = [];
        $val = [];
        if (isset($b['nom_service']) && $b['nom_service'] !== '') {
            // Ne touche qu'au francais : la traduction anglaise saisie cote
            // vitrine doit survivre a une modification faite au back-office.
            $set[] = 'title = JSON_SET(COALESCE(title, JSON_OBJECT()), "$.fr", ?)';
            $val[] = $b['nom_service'];
        }
        if (array_key_exists('description', $b)) {
            $set[] = 'description_metier = ?';
            $val[] = $b['description'];
        }
        if (array_key_exists('actif', $b)) {
            $set[] = 'is_active = ?';
            $val[] = (int) (bool) $b['actif'];
        }

        if ($set) {
            $set[] = 'updated_at = ?';
            $val[] = date('Y-m-d H:i:s');
            $val[] = $params['id'];
            try {
                Database::pdo()
                    ->prepare('UPDATE services SET ' . implode(', ', $set) . ' WHERE id = ?')
                    ->execute($val);
            } catch (PDOException $e) {
                Response::error('Modification impossible : donnees invalides.', 422);
            }
        }

        Response::ok($this->presente($this->find($params['id'])));
    }

    public function destroy(Request $req, array $params): void
    {
        Auth::requireSuperAdmin($req);
        if (!$this->find($params['id'])) {
            Response::error('Service introuvable.', 404);
        }
        try {
            Database::pdo()->prepare('DELETE FROM services WHERE id = ?')->execute([$params['id']]);
        } catch (PDOException $e) {
            Response::error('Suppression impossible : ce service porte encore des courses.', 409);
        }
        Response::noContent();
    }
}
