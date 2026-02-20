# Camions BL — PMO Portfolio Tool

## Structure du projet

```
Portefeuilledemo/
├── api/
│   ├── state.js       ← API: load/save state (Neon DB)
│   └── marcus.js      ← API: proxy AI advisor (Anthropic)
├── lib/
│   └── db.js          ← Database connection (Neon)
├── public/
│   └── index.html     ← Toute l'application frontend
├── vercel.json        ← Routing config
├── package.json       ← Dependencies
├── schema.sql         ← Database schema (run in Neon)
└── README.md
```

## Variables d'environnement (Vercel)

- `POSTGRES_URL` — Neon connection string (auto-injected via Vercel Storage)
- `ANTHROPIC_API_KEY` — For MARCUS AI advisor

## Comment mettre à jour sur GitHub

### ⚠️ NE PAS utiliser le drag-and-drop GitHub pour les dossiers!

GitHub web upload ne gère pas bien les dossiers (api/, lib/, public/).
Utilise plutôt **une de ces 2 méthodes** :

### Méthode 1 — Git command line (RECOMMANDÉ)

```bash
# 1. Clone ton repo (une seule fois)
git clone https://github.com/Sylgau-exe/Portefeuilledemo.git
cd Portefeuilledemo

# 2. Supprime l'ancien contenu (sauf .git)
find . -maxdepth 1 ! -name '.git' ! -name '.' -exec rm -rf {} +

# 3. Copie le nouveau contenu du zip extrait
cp -r /chemin/vers/camionsbl-v2/* .

# 4. Push
git add -A
git commit -m "Update PMO tool v2"
git push
```

### Méthode 2 — GitHub web (fichier par fichier)

Pour CHAQUE fichier, va sur GitHub → ton repo → navigue au fichier → Edit (crayon) → Colle le contenu → Commit.

Ordre: `package.json` → `vercel.json` → `lib/db.js` → `api/state.js` → `api/marcus.js` → `public/index.html`

Pour créer un nouveau fichier dans un dossier: clique "Add file" → "Create new file" → tape `api/state.js` (le slash crée le dossier automatiquement).

## Login

- Username: `admin`
- Password: `camionsbl2026`
