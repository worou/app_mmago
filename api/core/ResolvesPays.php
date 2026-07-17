<?php
// =====================================================================
// Trait partage : resolution du pays d'une ville, pour le cloisonnement.
// Utilise par les controleurs Clients / Livreurs / Courses / Paiements.
// =====================================================================

trait ResolvesPays
{
    // Pays d'une ville existante (null si la ville n'existe pas).
    protected function paysOfVille($villeId): ?int
    {
        $stmt = Database::pdo()->prepare('SELECT pays_id FROM villes WHERE id = ?');
        $stmt->execute([$villeId]);
        $p = $stmt->fetchColumn();
        return $p === false ? null : (int) $p;
    }
}
