<?php

namespace Database\Seeders;

use App\Models\City;
use App\Models\Country;
use App\Models\JobOffer;
use App\Models\Post;
use App\Models\TeamMember;
use App\Models\Value;
use Illuminate\Database\Seeder;

/**
 * Editorial content for the pages behind the nav: À propos, Carrières, Blog
 * and the per-country city coverage.
 *
 * `cover`/`photo` hold a bare filename resolved against
 * frontend/src/assets/content/. A missing file falls back to a gradient, so
 * copy changes never depend on an image being present.
 */
class PagesSeeder extends Seeder
{
    public function run(): void
    {
        $this->seedValues();
        $this->seedTeam();
        $this->seedPosts();
        $this->seedJobOffers();
        $this->seedCities();
    }

    private function seedValues(): void
    {
        $values = [
            [
                'key' => 'lafrique-dabord',
                'title' => ['fr' => 'L\'Afrique d\'abord', 'en' => 'Africa first'],
                'description' => [
                    'fr' => 'Nous ne transposons pas des solutions venues d\'ailleurs. Chaque fonctionnalité est pensée pour les réalités africaines : réseau intermittent, paiement en espèces, adressage informel.',
                    'en' => 'We do not transplant solutions from elsewhere. Every feature is designed for African realities: patchy networks, cash payments, informal addressing.',
                ],
                'icon' => 'pin',
            ],
            [
                'key' => 'simplicite-radicale',
                'title' => ['fr' => 'Simplicité radicale', 'en' => 'Radical simplicity'],
                'description' => [
                    'fr' => 'Une application doit s\'utiliser sans mode d\'emploi. Si une fonctionnalité demande une explication, c\'est qu\'elle est mal conçue.',
                    'en' => 'An app should work without a manual. If a feature needs explaining, it is badly designed.',
                ],
                'icon' => 'shield',
            ],
            [
                'key' => 'confiance-avant-tout',
                'title' => ['fr' => 'Confiance avant tout', 'en' => 'Trust above all'],
                'description' => [
                    'fr' => 'Chaque chauffeur et chaque livreur est vérifié. Chaque transaction est chiffrée. La confiance se gagne lentement et se perd en une course.',
                    'en' => 'Every driver and courier is vetted. Every transaction is encrypted. Trust is earned slowly and lost in a single ride.',
                ],
                'icon' => 'card',
            ],
            [
                'key' => 'proximite-reelle',
                'title' => ['fr' => 'Proximité réelle', 'en' => 'Genuine proximity'],
                'description' => [
                    'fr' => 'Nos équipes vivent dans les villes qu\'elles servent. Un problème à Douala se règle depuis Douala, pas depuis un siège à 6 000 km.',
                    'en' => 'Our teams live in the cities they serve. A problem in Douala is solved from Douala, not from a head office 6,000 km away.',
                ],
                'icon' => 'headset',
            ],
            [
                'key' => 'impact-local',
                'title' => ['fr' => 'Impact local', 'en' => 'Local impact'],
                'description' => [
                    'fr' => 'Plus de 40 000 partenaires gagnent leur vie grâce à MamaGo. Notre croissance n\'a de sens que si la leur suit.',
                    'en' => 'More than 40,000 partners earn their living through MamaGo. Our growth only means something if theirs follows.',
                ],
                'icon' => 'users',
            ],
            [
                'key' => 'exigence-technique',
                'title' => ['fr' => 'Exigence technique', 'en' => 'Technical rigour'],
                'description' => [
                    'fr' => 'Une seconde de latence coûte une course. Nous mesurons, nous optimisons, et nous recommençons.',
                    'en' => 'One second of latency costs a ride. We measure, we optimise, and we start again.',
                ],
                'icon' => 'clock',
            ],
        ];

        foreach ($values as $position => $value) {
            Value::updateOrCreate(['key' => $value['key']], $value + ['position' => $position]);
        }
    }

    private function seedTeam(): void
    {
        $team = [
            [
                'name' => 'Aminata Traoré',
                'role' => ['fr' => 'CEO & cofondatrice', 'en' => 'CEO & co-founder'],
                'bio' => [
                    'fr' => 'Ancienne directrice des opérations d\'un opérateur mobile panafricain. Elle a fondé MamaGo après avoir attendu deux heures un taxi sous la pluie à Abidjan.',
                    'en' => 'Former operations director at a pan-African mobile operator. She founded MamaGo after waiting two hours for a taxi in the rain in Abidjan.',
                ],
                'photo' => 'team-1.jpg',
            ],
            [
                'name' => 'Kwame Osei',
                'role' => ['fr' => 'CTO & cofondateur', 'en' => 'CTO & co-founder'],
                'bio' => [
                    'fr' => 'Ingénieur logiciel passé par Accra et Berlin. Il a conçu l\'architecture qui permet à l\'application de fonctionner même en 2G.',
                    'en' => 'Software engineer who worked in Accra and Berlin. He designed the architecture that keeps the app usable even on 2G.',
                ],
                'photo' => 'team-2.jpg',
            ],
            [
                'name' => 'Fatou Ndiaye',
                'role' => ['fr' => 'Directrice des opérations', 'en' => 'Chief Operating Officer'],
                'bio' => [
                    'fr' => 'Elle pilote le lancement de chaque nouvelle ville, du premier chauffeur recruté à la centième course quotidienne.',
                    'en' => 'She runs every new city launch, from the first driver recruited to the hundredth daily ride.',
                ],
                'photo' => 'team-3.jpg',
            ],
            [
                'name' => 'Jean-Marc Bello',
                'role' => ['fr' => 'Directeur financier', 'en' => 'Chief Financial Officer'],
                'bio' => [
                    'fr' => 'Vingt ans de finance en Afrique centrale. Il veille à ce que la croissance ne se fasse jamais au détriment des partenaires.',
                    'en' => 'Twenty years in finance across Central Africa. He makes sure growth never comes at our partners\' expense.',
                ],
                'photo' => 'team-4.jpg',
            ],
            [
                'name' => 'Chidi Okonkwo',
                'role' => ['fr' => 'VP Engineering', 'en' => 'VP Engineering'],
                'bio' => [
                    'fr' => 'Il dirige les équipes produit réparties entre Abidjan, Lagos et Dakar, et défend l\'idée qu\'un bon code se lit comme une phrase.',
                    'en' => 'He leads the product teams across Abidjan, Lagos and Dakar, and argues that good code reads like a sentence.',
                ],
                'photo' => 'team-5.jpg',
            ],
            [
                'name' => 'Leïla Benali',
                'role' => ['fr' => 'Directrice marketing', 'en' => 'Chief Marketing Officer'],
                'bio' => [
                    'fr' => 'Elle a construit la marque MamaGo autour d\'une conviction : parler aux gens comme à des voisins, pas comme à des utilisateurs.',
                    'en' => 'She built the MamaGo brand around one conviction: talk to people like neighbours, not like users.',
                ],
                'photo' => 'team-6.jpg',
            ],
        ];

        foreach ($team as $position => $member) {
            TeamMember::updateOrCreate(
                ['name' => $member['name']],
                $member + ['position' => $position, 'is_active' => true],
            );
        }
    }

    private function seedPosts(): void
    {
        $posts = [
            [
                'slug' => 'levee-de-fonds-serie-b',
                'title' => [
                    'fr' => 'MamaGo lève 12 millions de dollars pour accélérer son expansion',
                    'en' => 'MamaGo raises $12 million to accelerate its expansion',
                ],
                'category' => ['fr' => 'Actualités', 'en' => 'News'],
                'excerpt' => [
                    'fr' => 'Ce tour de table va financer l\'ouverture de six nouveaux pays et le recrutement de 200 personnes d\'ici la fin de l\'année.',
                    'en' => 'The round will fund six new country launches and 200 hires before the end of the year.',
                ],
                'author' => 'Aminata Traoré',
                'author_role' => ['fr' => 'CEO & cofondatrice', 'en' => 'CEO & co-founder'],
                'cover' => 'blog-levee-de-fonds.jpg',
                'read_minutes' => 4,
                'published_at' => '2026-06-24',
                'is_featured' => true,
                'body' => [
                    'fr' => <<<'TXT'
Nous annonçons aujourd'hui la clôture de notre série B : 12 millions de dollars, menés par un consortium d'investisseurs panafricains, avec la participation de nos partenaires historiques.

Il y a quatre ans, MamaGo était une application de réservation de taxis disponible dans un seul quartier d'Abidjan. Aujourd'hui, plus de cinq millions de personnes l'utilisent dans dix pays pour se déplacer, se faire livrer, faire leurs courses et payer.

Ce financement a trois objectifs. D'abord, ouvrir six nouveaux marchés en Afrique de l'Ouest et centrale d'ici dix-huit mois. Ensuite, renforcer nos équipes techniques : nous recrutons 200 personnes, dont la moitié en ingénierie, réparties entre Abidjan, Dakar et Douala. Enfin, investir dans les revenus de nos partenaires, avec un fonds dédié à l'équipement des livreurs.

Nous restons convaincus d'une chose : les meilleures solutions africaines se construisent en Afrique, avec des équipes qui vivent les problèmes qu'elles résolvent. Merci à nos partenaires, à nos équipes, et surtout à vous.
TXT,
                    'en' => <<<'TXT'
Today we are announcing the close of our Series B: $12 million, led by a consortium of pan-African investors, with participation from our long-standing partners.

Four years ago, MamaGo was a taxi-booking app available in a single Abidjan neighbourhood. Today more than five million people use it across ten countries to travel, get deliveries, shop and pay.

The funding has three goals. First, opening six new markets in West and Central Africa within eighteen months. Second, strengthening our technical teams: we are hiring 200 people, half of them in engineering, across Abidjan, Dakar and Douala. Third, investing in our partners' earnings, through a fund dedicated to equipping couriers.

We remain convinced of one thing: the best African solutions are built in Africa, by teams who live the problems they solve. Thank you to our partners, to our teams, and above all to you.
TXT,
                ],
            ],
            [
                'slug' => 'reduire-temps-attente-abidjan',
                'title' => [
                    'fr' => 'Comment nous avons réduit le temps d\'attente de 40 % à Abidjan',
                    'en' => 'How we cut waiting times by 40% in Abidjan',
                ],
                'category' => ['fr' => 'Produit', 'en' => 'Product'],
                'excerpt' => [
                    'fr' => 'Un algorithme d\'affectation repensé autour d\'une contrainte que personne n\'avait modélisée : les embouteillages du Plateau.',
                    'en' => 'A dispatch algorithm rebuilt around a constraint nobody had modelled: the traffic jams of the Plateau.',
                ],
                'author' => 'Kwame Osei',
                'author_role' => ['fr' => 'CTO & cofondateur', 'en' => 'CTO & co-founder'],
                'cover' => 'blog-temps-attente.jpg',
                'read_minutes' => 6,
                'published_at' => '2026-06-11',
                'is_featured' => false,
                'body' => [
                    'fr' => <<<'TXT'
Pendant longtemps, notre algorithme affectait la course au chauffeur le plus proche à vol d'oiseau. C'est la solution évidente. C'est aussi la mauvaise.

À Abidjan, deux points séparés de 800 mètres peuvent être à vingt minutes l'un de l'autre si un pont les sépare aux heures de pointe. Le chauffeur « le plus proche » était souvent le plus lent à arriver.

Nous avons donc remplacé la distance par une estimation du temps de trajet réel, nourrie par les traces GPS anonymisées de nos propres courses. Le modèle apprend que le boulevard VGE à 7 h 30 n'a rien à voir avec le même boulevard à 14 h.

Résultat sur trois mois : le temps d'attente médian est passé de 8 minutes 40 à 5 minutes 10, soit une baisse de 40 %. Les annulations avant prise en charge ont chuté d'un tiers. Et les chauffeurs font plus de courses par heure, donc gagnent davantage.

La leçon nous semble générale : importer une solution conçue pour une ville quadrillée et fluide ne fonctionne pas. Il faut modéliser la ville telle qu'elle est.
TXT,
                    'en' => <<<'TXT'
For a long time, our algorithm assigned each ride to the nearest driver as the crow flies. It is the obvious solution. It is also the wrong one.

In Abidjan, two points 800 metres apart can be twenty minutes from each other if a bridge separates them at rush hour. The "nearest" driver was often the slowest to arrive.

So we replaced distance with an estimate of real travel time, fed by anonymised GPS traces from our own rides. The model learns that Boulevard VGE at 7:30 am has nothing in common with the same road at 2 pm.

The result over three months: median waiting time fell from 8 minutes 40 to 5 minutes 10, a 40% drop. Cancellations before pickup fell by a third. And drivers complete more rides per hour, so they earn more.

The lesson feels general: importing a solution designed for a gridded, free-flowing city does not work. You have to model the city as it actually is.
TXT,
                ],
            ],
            [
                'slug' => 'paiement-mobile-afrique',
                'title' => [
                    'fr' => 'Paiement mobile : pourquoi l\'Afrique invente le futur de la finance',
                    'en' => 'Mobile payments: why Africa is inventing the future of finance',
                ],
                'category' => ['fr' => 'Décryptage', 'en' => 'Analysis'],
                'excerpt' => [
                    'fr' => 'Pendant que l\'Europe débat du sans-contact, des centaines de millions de personnes paient déjà tout avec un téléphone sans écran tactile.',
                    'en' => 'While Europe debates contactless cards, hundreds of millions already pay for everything with a phone that has no touchscreen.',
                ],
                'author' => 'Jean-Marc Bello',
                'author_role' => ['fr' => 'Directeur financier', 'en' => 'Chief Financial Officer'],
                'cover' => 'blog-paiement-mobile.jpg',
                'read_minutes' => 5,
                'published_at' => '2026-05-28',
                'is_featured' => false,
                'body' => [
                    'fr' => <<<'TXT'
Le paiement mobile n'est pas une innovation importée en Afrique. Il y est né, et le continent a une décennie d'avance sur ce que d'autres marchés découvrent à peine.

La raison est simple : là où l'infrastructure bancaire n'a jamais été dense, il n'y a rien à remplacer. Pas de réseau d'agences à protéger, pas de cartes à faire cohabiter avec un nouveau système. On construit directement ce qui marche.

Chez MamaGo, cela nous impose une discipline : accepter tous les moyens de paiement, sans hiérarchie. Le portefeuille MamaGo, les opérateurs mobiles, la carte bancaire pour ceux qui en ont une, et l'espèce — qui reste majoritaire dans plusieurs de nos villes.

Refuser l'espèce serait exclure une partie de nos clients. Nous préférons rendre le passage au portefeuille tellement simple qu'il devienne évident, plutôt que forcé.

Le futur de la finance ne ressemblera pas à une carte sans contact. Il ressemblera à un numéro de téléphone.
TXT,
                    'en' => <<<'TXT'
Mobile payment is not an innovation imported into Africa. It was born here, and the continent is a decade ahead of what other markets are only beginning to discover.

The reason is simple: where banking infrastructure was never dense, there is nothing to replace. No branch network to protect, no cards to reconcile with a new system. You build what works, directly.

At MamaGo, that imposes a discipline: accept every payment method, without hierarchy. The MamaGo wallet, mobile operators, bank cards for those who have one, and cash — still the majority in several of our cities.

Refusing cash would mean excluding part of our customers. We would rather make moving to the wallet so simple that it becomes obvious, instead of forced.

The future of finance will not look like a contactless card. It will look like a phone number.
TXT,
                ],
            ],
            [
                'slug' => 'portrait-fatou-livreuse-dakar',
                'title' => [
                    'fr' => 'Fatou, livreuse à Dakar : « Je choisis mes horaires, c\'est tout ce que je demandais »',
                    'en' => 'Fatou, courier in Dakar: "I choose my own hours — that is all I was asking for"',
                ],
                'category' => ['fr' => 'Communauté', 'en' => 'Community'],
                'excerpt' => [
                    'fr' => 'Portrait d\'une partenaire de la première heure, qui a monté sa propre équipe de trois livreurs en deux ans.',
                    'en' => 'A portrait of an early partner who built her own team of three couriers in two years.',
                ],
                'author' => 'Leïla Benali',
                'author_role' => ['fr' => 'Directrice marketing', 'en' => 'Chief Marketing Officer'],
                'cover' => 'blog-portrait-livreuse.jpg',
                'read_minutes' => 4,
                'published_at' => '2026-05-14',
                'is_featured' => false,
                'body' => [
                    'fr' => <<<'TXT'
Fatou Sow a rejoint MamaGo il y a deux ans, trois semaines après le lancement à Dakar. Elle était alors vendeuse sur un marché de Grand-Yoff.

« Ce qui m'a décidée, ce n'est pas l'argent au début. C'est de pouvoir m'arrêter à 16 h pour aller chercher ma fille à l'école, sans demander la permission à personne. »

En deux ans, elle est passée de deux livraisons par jour à une trentaine, et a formé trois livreurs qui travaillent désormais avec elle. Elle gère leurs plannings depuis l'application, et négocie elle-même ses contrats avec deux restaurants du quartier.

« Le plus dur, ce sont les adresses. Ici, personne ne dit "12 rue untel". On dit "derrière la station, la maison bleue". Au début je perdais des heures. »

C'est ce retour, répété par des centaines de livreurs, qui nous a poussés à construire notre système de points de repère : les clients peuvent enregistrer une description et une photo plutôt qu'une adresse formelle. Une fonctionnalité qui n'aurait aucun sens ailleurs, et qui est devenue essentielle ici.
TXT,
                    'en' => <<<'TXT'
Fatou Sow joined MamaGo two years ago, three weeks after the Dakar launch. At the time she was a trader in a Grand-Yoff market.

"What convinced me wasn't the money, at first. It was being able to stop at 4 pm to pick my daughter up from school, without asking anyone's permission."

In two years she has gone from two deliveries a day to about thirty, and has trained three couriers who now work alongside her. She manages their schedules from the app, and negotiates her own contracts with two restaurants in the neighbourhood.

"The hardest part is addresses. Here, nobody says '12 such-and-such street'. They say 'behind the petrol station, the blue house'. At the start I lost hours."

That feedback, repeated by hundreds of couriers, is what pushed us to build our landmark system: customers can save a description and a photo rather than a formal address. A feature that would make no sense elsewhere, and that has become essential here.
TXT,
                ],
            ],
            [
                'slug' => 'mamago-arrive-au-gabon',
                'title' => ['fr' => 'MamaGo arrive au Gabon', 'en' => 'MamaGo launches in Gabon'],
                'category' => ['fr' => 'Actualités', 'en' => 'News'],
                'excerpt' => [
                    'fr' => 'Libreville devient notre dixième pays. Transport et livraison sont disponibles dès aujourd\'hui, le paiement suivra en septembre.',
                    'en' => 'Libreville becomes our tenth country. Rides and delivery are live today; payments follow in September.',
                ],
                'author' => 'Fatou Ndiaye',
                'author_role' => ['fr' => 'Directrice des opérations', 'en' => 'Chief Operating Officer'],
                'cover' => 'blog-gabon.jpg',
                'read_minutes' => 3,
                'published_at' => '2026-04-30',
                'is_featured' => false,
                'body' => [
                    'fr' => <<<'TXT'
À partir d'aujourd'hui, MamaGo est disponible à Libreville. C'est notre dixième pays, et le troisième en Afrique centrale après le Cameroun et la RDC.

Le lancement démarre avec le transport et la livraison. Le portefeuille et le paiement entre particuliers arriveront en septembre, une fois les agréments finalisés avec les autorités locales.

Nous avons passé quatre mois sur place avant d'ouvrir. Recruter et former 300 chauffeurs, cartographier les quartiers, comprendre pourquoi les trajets vers Port-Gentil se font en avion et pas en voiture. Un lancement réussi, c'est 80 % de travail invisible fait avant le premier jour.

Port-Gentil suivra début 2027.
TXT,
                    'en' => <<<'TXT'
From today, MamaGo is available in Libreville. It is our tenth country, and the third in Central Africa after Cameroon and the DRC.

The launch starts with rides and delivery. The wallet and peer-to-peer payments arrive in September, once approvals are finalised with the local authorities.

We spent four months on the ground before opening. Recruiting and training 300 drivers, mapping the neighbourhoods, understanding why journeys to Port-Gentil are made by plane rather than car. A successful launch is 80% invisible work done before day one.

Port-Gentil follows in early 2027.
TXT,
                ],
            ],
            [
                'slug' => 'conseils-livraison-heures-pointe',
                'title' => [
                    'fr' => '5 conseils pour vos livraisons aux heures de pointe',
                    'en' => '5 tips for your deliveries at peak hours',
                ],
                'category' => ['fr' => 'Conseils', 'en' => 'Tips'],
                'excerpt' => [
                    'fr' => 'Comment faire arriver un repas chaud entre 12 h et 14 h, quand toute la ville commande en même temps.',
                    'en' => 'How to get a hot meal delivered between noon and 2 pm, when the whole city orders at once.',
                ],
                'author' => 'Fatou Ndiaye',
                'author_role' => ['fr' => 'Directrice des opérations', 'en' => 'Chief Operating Officer'],
                'cover' => 'blog-conseils-livraison.jpg',
                'read_minutes' => 3,
                'published_at' => '2026-04-08',
                'is_featured' => false,
                'body' => [
                    'fr' => <<<'TXT'
Entre 12 h et 14 h, nous traitons près d'un tiers des livraisons de la journée. Voici ce qui fait vraiment la différence, d'après nos données.

**Commandez avant 11 h 45.** Quinze minutes plus tôt, c'est en moyenne dix-huit minutes de livraison en moins. La courbe de saturation est brutale, pas linéaire.

**Enregistrez votre point de repère.** Les commandes avec une description de repère et une photo arrivent en moyenne sept minutes plus vite. C'est le gain le plus simple à obtenir.

**Groupez vos commandes de bureau.** Une livraison pour cinq personnes coûte moins cher et mobilise un seul livreur. Tout le monde y gagne, y compris les autres clients du quartier.

**Payez d'avance.** Le paiement à la livraison ajoute en moyenne deux minutes par course, le temps de faire l'appoint.

**Notez votre livreur.** Ce n'est pas une formalité : les notes alimentent directement l'attribution des courses. Un bon livreur bien noté travaille davantage.
TXT,
                    'en' => <<<'TXT'
Between noon and 2 pm we handle nearly a third of the day's deliveries. Here is what actually makes a difference, based on our data.

**Order before 11:45.** Fifteen minutes earlier means eighteen fewer minutes of delivery time on average. The saturation curve is brutal, not linear.

**Save your landmark.** Orders with a landmark description and a photo arrive seven minutes faster on average. It is the easiest gain available.

**Group your office orders.** One delivery for five people costs less and occupies a single courier. Everyone wins, including the other customers in the neighbourhood.

**Pay in advance.** Cash on delivery adds about two minutes per trip, the time it takes to find change.

**Rate your courier.** This is not a formality: ratings feed directly into how rides are assigned. A well-rated courier works more.
TXT,
                ],
            ],
        ];

        foreach ($posts as $post) {
            Post::updateOrCreate(['slug' => $post['slug']], $post + ['is_active' => true]);
        }
    }

    private function seedJobOffers(): void
    {
        $offers = [
            [
                'slug' => 'ingenieur-backend-senior',
                'title' => ['fr' => 'Ingénieur·e Backend Senior', 'en' => 'Senior Backend Engineer'],
                'department' => ['fr' => 'Ingénierie', 'en' => 'Engineering'],
                'location' => 'Abidjan',
                'contract' => ['fr' => 'CDI', 'en' => 'Permanent'],
                'excerpt' => [
                    'fr' => 'Concevoir les services qui traitent des centaines de milliers de courses par jour, avec une contrainte : ça doit marcher en 2G.',
                    'en' => 'Build the services that handle hundreds of thousands of rides a day, under one constraint: it has to work on 2G.',
                ],
                'mission' => [
                    'fr' => 'Vous rejoignez l\'équipe qui construit le cœur de MamaGo : l\'affectation des courses, le calcul des prix et le suivi temps réel. Vos décisions techniques se mesurent en minutes d\'attente pour cinq millions de personnes.',
                    'en' => 'You join the team building the core of MamaGo: ride dispatch, pricing and real-time tracking. Your technical decisions are measured in minutes of waiting for five million people.',
                ],
                'responsibilities' => [
                    'fr' => [
                        'Concevoir et faire évoluer les services d\'affectation et de tarification',
                        'Optimiser les temps de réponse sur des réseaux lents et instables',
                        'Encadrer techniquement deux à trois ingénieurs',
                        'Participer aux astreintes de l\'équipe (une semaine sur six)',
                    ],
                    'en' => [
                        'Design and evolve the dispatch and pricing services',
                        'Optimise response times on slow, unstable networks',
                        'Provide technical mentorship to two or three engineers',
                        'Take part in the team\'s on-call rota (one week in six)',
                    ],
                ],
                'requirements' => [
                    'fr' => [
                        'Cinq ans ou plus en développement backend (PHP, Go, Java ou équivalent)',
                        'Expérience solide des bases de données relationnelles et du cache',
                        'À l\'aise avec les systèmes distribués et la mesure de performance',
                        'Français courant, anglais technique',
                    ],
                    'en' => [
                        'Five years or more in backend development (PHP, Go, Java or equivalent)',
                        'Solid experience with relational databases and caching',
                        'Comfortable with distributed systems and performance measurement',
                        'Fluent French, technical English',
                    ],
                ],
            ],
            [
                'slug' => 'product-designer',
                'title' => ['fr' => 'Product Designer', 'en' => 'Product Designer'],
                'department' => ['fr' => 'Design', 'en' => 'Design'],
                'location' => 'Dakar',
                'contract' => ['fr' => 'CDI', 'en' => 'Permanent'],
                'excerpt' => [
                    'fr' => 'Dessiner des parcours utilisables par quelqu\'un qui n\'a jamais utilisé d\'application, sur un écran de cinq pouces au soleil.',
                    'en' => 'Design flows usable by someone who has never used an app before, on a five-inch screen in full sunlight.',
                ],
                'mission' => [
                    'fr' => 'Vous êtes responsable de l\'expérience de bout en bout sur un ou deux services (transport, livraison, paiement). Vous passez autant de temps sur le terrain avec les utilisateurs que devant votre écran.',
                    'en' => 'You own the end-to-end experience of one or two services (rides, delivery, payments). You spend as much time in the field with users as you do at your screen.',
                ],
                'responsibilities' => [
                    'fr' => [
                        'Mener les recherches utilisateurs sur le terrain, dans plusieurs villes',
                        'Concevoir les parcours, du wireframe à la maquette finale',
                        'Faire vivre et enrichir notre design system',
                        'Confronter chaque hypothèse à un test utilisateur avant développement',
                    ],
                    'en' => [
                        'Run field user research across several cities',
                        'Design the flows, from wireframe to final mockup',
                        'Maintain and extend our design system',
                        'Test every assumption with users before development starts',
                    ],
                ],
                'requirements' => [
                    'fr' => [
                        'Trois ans ou plus en design produit mobile',
                        'Portfolio démontrant des décisions justifiées, pas seulement de jolies maquettes',
                        'Expérience de la recherche utilisateur en contexte contraint',
                        'Français courant',
                    ],
                    'en' => [
                        'Three years or more in mobile product design',
                        'A portfolio showing justified decisions, not just attractive mockups',
                        'Experience of user research in constrained settings',
                        'Fluent French',
                    ],
                ],
            ],
            [
                'slug' => 'city-manager-douala',
                'title' => ['fr' => 'City Manager — Douala', 'en' => 'City Manager — Douala'],
                'department' => ['fr' => 'Opérations', 'en' => 'Operations'],
                'location' => 'Douala',
                'contract' => ['fr' => 'CDI', 'en' => 'Permanent'],
                'excerpt' => [
                    'fr' => 'Piloter l\'activité d\'une ville entière : chauffeurs, livreurs, restaurants, croissance et qualité de service.',
                    'en' => 'Run an entire city: drivers, couriers, restaurants, growth and service quality.',
                ],
                'mission' => [
                    'fr' => 'Vous êtes responsable de la performance de MamaGo à Douala : l\'offre de partenaires, la demande, la qualité de service et la rentabilité. C\'est un poste de terrain, pas de bureau.',
                    'en' => 'You are accountable for MamaGo\'s performance in Douala: partner supply, demand, service quality and profitability. This is a field role, not a desk job.',
                ],
                'responsibilities' => [
                    'fr' => [
                        'Recruter et fidéliser chauffeurs, livreurs et commerçants partenaires',
                        'Suivre les indicateurs quotidiens et corriger les déséquilibres offre/demande',
                        'Gérer une équipe locale de cinq à dix personnes',
                        'Représenter MamaGo auprès des autorités et partenaires locaux',
                    ],
                    'en' => [
                        'Recruit and retain driver, courier and merchant partners',
                        'Track daily metrics and correct supply/demand imbalances',
                        'Manage a local team of five to ten people',
                        'Represent MamaGo with local authorities and partners',
                    ],
                ],
                'requirements' => [
                    'fr' => [
                        'Cinq ans ou plus en opérations, dont deux en management d\'équipe',
                        'Connaissance fine du terrain camerounais',
                        'À l\'aise avec les chiffres : vous pilotez par la donnée',
                        'Français courant, anglais apprécié',
                    ],
                    'en' => [
                        'Five years or more in operations, including two managing a team',
                        'Deep knowledge of the Cameroonian market',
                        'Comfortable with numbers: you manage by data',
                        'Fluent French, English a plus',
                    ],
                ],
            ],
            [
                'slug' => 'data-analyst',
                'title' => ['fr' => 'Data Analyst', 'en' => 'Data Analyst'],
                'department' => ['fr' => 'Data', 'en' => 'Data'],
                'location' => 'Abidjan',
                'contract' => ['fr' => 'CDI', 'en' => 'Permanent'],
                'excerpt' => [
                    'fr' => 'Transformer des millions de courses en décisions : où lancer, combien facturer, quel livreur affecter.',
                    'en' => 'Turn millions of rides into decisions: where to launch, what to charge, which courier to assign.',
                ],
                'mission' => [
                    'fr' => 'Vous travaillez avec les équipes opérations et produit pour répondre aux questions qui engagent l\'entreprise. Vos analyses arbitrent des décisions à plusieurs millions.',
                    'en' => 'You work with the operations and product teams to answer the questions that commit the company. Your analyses settle multi-million decisions.',
                ],
                'responsibilities' => [
                    'fr' => [
                        'Construire les tableaux de bord suivis quotidiennement par les villes',
                        'Analyser l\'équilibre offre/demande et proposer des ajustements tarifaires',
                        'Concevoir et interpréter les tests A/B produit',
                        'Rendre vos résultats compréhensibles par des non-spécialistes',
                    ],
                    'en' => [
                        'Build the dashboards cities rely on every day',
                        'Analyse supply/demand balance and propose pricing adjustments',
                        'Design and interpret product A/B tests',
                        'Make your findings understandable to non-specialists',
                    ],
                ],
                'requirements' => [
                    'fr' => [
                        'Trois ans ou plus en analyse de données',
                        'SQL avancé, Python ou R',
                        'Solides bases en statistiques, notamment sur les tests',
                        'Français courant',
                    ],
                    'en' => [
                        'Three years or more in data analysis',
                        'Advanced SQL, Python or R',
                        'Strong statistics fundamentals, particularly around testing',
                        'Fluent French',
                    ],
                ],
            ],
            [
                'slug' => 'responsable-support-client',
                'title' => ['fr' => 'Responsable Support Client', 'en' => 'Customer Support Manager'],
                'department' => ['fr' => 'Support', 'en' => 'Support'],
                'location' => 'Lomé',
                'contract' => ['fr' => 'CDI', 'en' => 'Permanent'],
                'excerpt' => [
                    'fr' => 'Structurer un support disponible 24/7 en quatre langues, sur dix pays et trois fuseaux horaires.',
                    'en' => 'Build a support operation running 24/7 in four languages, across ten countries and three time zones.',
                ],
                'mission' => [
                    'fr' => 'Vous dirigez le centre de support de Lomé, qui traite les demandes des clients et des partenaires de toute la région. Votre mission : résoudre vite, et faire remonter ce qui doit être corrigé à la source.',
                    'en' => 'You lead the Lomé support centre, handling customer and partner requests across the region. Your mission: resolve fast, and escalate what needs fixing at the source.',
                ],
                'responsibilities' => [
                    'fr' => [
                        'Encadrer une équipe de vingt conseillers, en horaires décalés',
                        'Tenir les engagements de délai de première réponse et de résolution',
                        'Faire remonter les problèmes récurrents aux équipes produit',
                        'Recruter et former à mesure de l\'ouverture de nouveaux pays',
                    ],
                    'en' => [
                        'Manage a team of twenty advisers working shifts',
                        'Meet first-response and resolution time commitments',
                        'Escalate recurring problems to the product teams',
                        'Recruit and train as new countries open',
                    ],
                ],
                'requirements' => [
                    'fr' => [
                        'Quatre ans ou plus en support client, dont deux en management',
                        'Expérience d\'un centre multilingue',
                        'Rigueur sur les indicateurs de qualité de service',
                        'Français et anglais courants',
                    ],
                    'en' => [
                        'Four years or more in customer support, including two in management',
                        'Experience running a multilingual centre',
                        'Rigour around service-quality metrics',
                        'Fluent French and English',
                    ],
                ],
            ],
        ];

        foreach ($offers as $offer) {
            JobOffer::updateOrCreate(['slug' => $offer['slug']], $offer + ['is_active' => true]);
        }
    }

    private function seedCities(): void
    {
        // Keyed by the country's language-neutral key: `name` is a JSON locale
        // map now, so it can no longer be matched with a plain where().
        $byCountry = [
            'cote-divoire' => [
                ['name' => 'Abidjan', 'is_capital' => true, 'services' => ['transport', 'livraison', 'shopping', 'restauration', 'paiement']],
                ['name' => 'Bouaké', 'services' => ['transport', 'livraison', 'paiement']],
                ['name' => 'Yamoussoukro', 'services' => ['transport', 'livraison']],
                ['name' => 'San-Pédro', 'services' => ['transport', 'livraison']],
            ],
            'senegal' => [
                ['name' => 'Dakar', 'is_capital' => true, 'services' => ['transport', 'livraison', 'shopping', 'restauration', 'paiement']],
                ['name' => 'Thiès', 'services' => ['transport', 'livraison', 'paiement']],
                ['name' => 'Saint-Louis', 'services' => ['transport', 'livraison']],
            ],
            'cameroun' => [
                ['name' => 'Douala', 'services' => ['transport', 'livraison', 'shopping', 'restauration', 'paiement']],
                ['name' => 'Yaoundé', 'is_capital' => true, 'services' => ['transport', 'livraison', 'restauration', 'paiement']],
                ['name' => 'Bafoussam', 'services' => ['transport', 'livraison']],
            ],
            'mali' => [
                ['name' => 'Bamako', 'is_capital' => true, 'services' => ['transport', 'livraison', 'restauration', 'paiement']],
                ['name' => 'Sikasso', 'services' => ['transport', 'livraison']],
            ],
            'burkina-faso' => [
                ['name' => 'Ouagadougou', 'is_capital' => true, 'services' => ['transport', 'livraison', 'restauration', 'paiement']],
                ['name' => 'Bobo-Dioulasso', 'services' => ['transport', 'livraison']],
            ],
            'benin' => [
                ['name' => 'Cotonou', 'services' => ['transport', 'livraison', 'restauration', 'paiement']],
                ['name' => 'Porto-Novo', 'is_capital' => true, 'services' => ['transport', 'livraison']],
            ],
            'gabon' => [
                ['name' => 'Libreville', 'is_capital' => true, 'services' => ['transport', 'livraison']],
                ['name' => 'Port-Gentil', 'services' => ['transport']],
            ],
            'togo' => [
                ['name' => 'Lomé', 'is_capital' => true, 'services' => ['transport', 'livraison', 'restauration', 'paiement']],
                ['name' => 'Sokodé', 'services' => ['transport', 'livraison']],
            ],
            'rdc' => [
                ['name' => 'Kinshasa', 'is_capital' => true, 'services' => ['transport', 'livraison', 'shopping', 'paiement']],
                ['name' => 'Lubumbashi', 'services' => ['transport', 'livraison', 'paiement']],
                ['name' => 'Goma', 'services' => ['transport', 'livraison']],
            ],
        ];

        foreach ($byCountry as $countryKey => $cities) {
            $country = Country::where('key', $countryKey)->first();

            // The landing page's country list is the source of truth; skip
            // quietly if it has been edited rather than failing the seed.
            if (! $country) {
                continue;
            }

            foreach ($cities as $position => $city) {
                City::updateOrCreate(
                    ['country_id' => $country->id, 'name' => $city['name']],
                    $city + ['country_id' => $country->id, 'position' => $position, 'is_capital' => false],
                );
            }
        }
    }
}
