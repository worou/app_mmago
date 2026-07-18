<?php

namespace Database\Seeders;

use App\Models\Country;
use App\Models\Guarantee;
use App\Models\Service;
use App\Models\Stat;
use Illuminate\Database\Seeder;

/**
 * Content shown on the public landing page, transcribed from the maquette.
 *
 * Translatable fields hold a {"fr": …, "en": …} map. Each entry is upserted on a
 * language-neutral key (`slug`, `key`) so re-seeding refreshes copy without
 * duplicating rows or breaking leads that reference a country.
 */
class LandingSeeder extends Seeder
{
    public function run(): void
    {
        $this->seedServices();
        $this->seedCountries();
        $this->seedStats();
        $this->seedGuarantees();
    }

    private function seedServices(): void
    {
        $services = [
            [
                'slug' => 'transport',
                'title' => ['fr' => 'Transport', 'en' => 'Rides'],
                'description' => [
                    'fr' => 'Réservez vos trajets en taxi, moto ou VTC en toute simplicité.',
                    'en' => 'Book a taxi, motorbike or private car in a couple of taps.',
                ],
                'icon' => 'car',
            ],
            [
                'slug' => 'livraison',
                'title' => ['fr' => 'Livraison', 'en' => 'Delivery'],
                'description' => [
                    'fr' => 'Faites livrer vos colis, repas et courses rapidement.',
                    'en' => 'Get parcels, meals and groceries delivered fast.',
                ],
                'icon' => 'scooter',
            ],
            [
                'slug' => 'shopping',
                'title' => ['fr' => 'Shopping', 'en' => 'Shopping'],
                'description' => [
                    'fr' => 'Achetez vos produits en ligne parmi des milliers d\'articles.',
                    'en' => 'Shop online from thousands of items.',
                ],
                'icon' => 'bag',
            ],
            [
                'slug' => 'restauration',
                'title' => ['fr' => 'Restauration', 'en' => 'Food'],
                'description' => [
                    'fr' => 'Commandez vos plats préférés chez vos restaurants favoris.',
                    'en' => 'Order your favourite dishes from the restaurants you love.',
                ],
                'icon' => 'food',
            ],
            [
                'slug' => 'paiement',
                'title' => ['fr' => 'Paiement', 'en' => 'Payments'],
                'description' => [
                    'fr' => 'Payez, transférez et gérez votre argent en toute sécurité.',
                    'en' => 'Pay, transfer and manage your money securely.',
                ],
                'icon' => 'wallet',
            ],
            // The maquette repeats the "Paiement" card verbatim in slot 6.
            // Transcribed as-is rather than invented; edit this entry to
            // whatever the sixth service should be (the in-app grid suggests
            // "Courses"), or drop it to fall back to a 6-card row.
            [
                'slug' => 'paiement-2',
                'title' => ['fr' => 'Paiement', 'en' => 'Payments'],
                'description' => [
                    'fr' => 'Payez, transférez et gérez votre argent en toute sécurité.',
                    'en' => 'Pay, transfer and manage your money securely.',
                ],
                'icon' => 'wallet-alt',
            ],
            [
                'slug' => 'plus-de-services',
                'title' => ['fr' => 'Plus de services', 'en' => 'More services'],
                'description' => [
                    'fr' => 'Réservations, événements, pharmacies, billets et bien plus encore.',
                    'en' => 'Bookings, events, pharmacies, tickets and much more.',
                ],
                'icon' => 'grid',
            ],
        ];

        foreach ($services as $position => $service) {
            Service::updateOrCreate(
                ['slug' => $service['slug']],
                $service + ['position' => $position, 'is_active' => true, 'link' => '#'],
            );
        }
    }

    private function seedCountries(): void
    {
        $countries = [
            ['key' => 'cote-divoire', 'name' => ['fr' => 'Côte d\'Ivoire', 'en' => 'Ivory Coast'], 'code' => 'CI'],
            ['key' => 'senegal', 'name' => ['fr' => 'Sénégal', 'en' => 'Senegal'], 'code' => 'SN'],
            ['key' => 'cameroun', 'name' => ['fr' => 'Cameroun', 'en' => 'Cameroon'], 'code' => 'CM'],
            ['key' => 'mali', 'name' => ['fr' => 'Mali', 'en' => 'Mali'], 'code' => 'ML'],
            ['key' => 'burkina-faso', 'name' => ['fr' => 'Burkina Faso', 'en' => 'Burkina Faso'], 'code' => 'BF'],
            ['key' => 'benin', 'name' => ['fr' => 'Bénin', 'en' => 'Benin'], 'code' => 'BJ'],
            ['key' => 'gabon', 'name' => ['fr' => 'Gabon', 'en' => 'Gabon'], 'code' => 'GA'],
            ['key' => 'togo', 'name' => ['fr' => 'Togo', 'en' => 'Togo'], 'code' => 'TG'],
            ['key' => 'rdc', 'name' => ['fr' => 'RDC', 'en' => 'DRC'], 'code' => 'CD'],
            // Trailing tile in the maquette — not a country, so it carries no
            // ISO code and never appears in the contact form's picker.
            [
                'key' => 'et-plus-encore',
                'name' => ['fr' => 'Et plus encore', 'en' => 'And more'],
                'code' => null,
                'is_placeholder' => true,
            ],
        ];

        foreach ($countries as $position => $country) {
            Country::updateOrCreate(
                ['key' => $country['key']],
                $country + ['position' => $position, 'is_active' => true, 'is_placeholder' => false],
            );
        }
    }

    private function seedStats(): void
    {
        $stats = [
            ['key' => 'users', 'value' => '+5M', 'label' => ['fr' => 'Utilisateurs', 'en' => 'Users'], 'icon' => 'users'],
            ['key' => 'countries', 'value' => '10+', 'label' => ['fr' => 'Pays', 'en' => 'Countries'], 'icon' => 'pin'],
            ['key' => 'secure', 'value' => '100%', 'label' => ['fr' => 'Sécurisé', 'en' => 'Secure'], 'icon' => 'shield'],
            ['key' => 'support', 'value' => '24/7', 'label' => ['fr' => 'Support', 'en' => 'Support'], 'icon' => 'headset'],
        ];

        foreach ($stats as $position => $stat) {
            Stat::updateOrCreate(['key' => $stat['key']], $stat + ['position' => $position]);
        }
    }

    private function seedGuarantees(): void
    {
        $guarantees = [
            [
                'key' => 'securite-garantie',
                'title' => ['fr' => 'Sécurité garantie', 'en' => 'Guaranteed security'],
                'subtitle' => ['fr' => 'Vos données sont protégées', 'en' => 'Your data is protected'],
                'icon' => 'shield',
            ],
            [
                'key' => 'paiements-securises',
                'title' => ['fr' => 'Paiements sécurisés', 'en' => 'Secure payments'],
                'subtitle' => ['fr' => 'Transactions 100% sécurisées', 'en' => '100% secure transactions'],
                'icon' => 'card',
            ],
            [
                // Matches Str::slug('Disponibilité 24/7'), which drops the
                // slash rather than turning it into a separator.
                'key' => 'disponibilite-247',
                'title' => ['fr' => 'Disponibilité 24/7', 'en' => 'Available 24/7'],
                'subtitle' => ['fr' => 'Nous sommes là pour vous', 'en' => 'We are here for you'],
                'icon' => 'headset',
            ],
            [
                'key' => 'support-reactif',
                'title' => ['fr' => 'Support réactif', 'en' => 'Responsive support'],
                'subtitle' => ['fr' => 'Assistance rapide et efficace', 'en' => 'Fast, effective assistance'],
                'icon' => 'clock',
            ],
        ];

        foreach ($guarantees as $position => $guarantee) {
            Guarantee::updateOrCreate(['key' => $guarantee['key']], $guarantee + ['position' => $position]);
        }
    }
}
