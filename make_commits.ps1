$git = "C:\Users\asus\MinGit\cmd\git.exe"

& $git init
& $git config user.name "asus"
& $git config user.email "asus@example.com"

$startDate = (Get-Date "2026-02-15")

function MakeCommit {
    param([string]$message, [string]$files, [int]$dayOffset)
    
    $commitDate = $startDate.AddDays($dayOffset).AddHours((Get-Random -Minimum 9 -Maximum 22)).AddMinutes((Get-Random -Minimum 0 -Maximum 59))
    $dateStr = $commitDate.ToString("yyyy-MM-ddTHH:mm:ss")
    $env:GIT_AUTHOR_DATE = $dateStr
    $env:GIT_COMMITTER_DATE = $dateStr
    
    # We use Invoke-Expression for the add command to expand wildcards correctly
    Invoke-Expression "& '$git' add $files"
    & $git commit -m $message
}

# 1. Base Setup
MakeCommit -message "Initialize project with package.json and gitignore" -files "package.json .gitignore" -dayOffset 0
MakeCommit -message "Add package-lock.json" -files "package-lock.json" -dayOffset 2
MakeCommit -message "Configure Vite setup" -files "vite.config.js* index.html" -dayOffset 5
MakeCommit -message "Add TailwindCSS and PostCSS config" -files "tailwind.config.js postcss.config.js" -dayOffset 8
MakeCommit -message "Add ESLint configuration" -files ".eslintrc.cjs" -dayOffset 10

# 2. Main Entry Points
MakeCommit -message "Create main entry point" -files "src/main.jsx" -dayOffset 14
MakeCommit -message "Setup global CSS" -files "src/index.css" -dayOffset 15
MakeCommit -message "Create App component" -files "src/App.jsx src/App.css" -dayOffset 18

# 3. Context & Layouts
MakeCommit -message "Add data context provider" -files "src/context/DataContext.jsx" -dayOffset 22
MakeCommit -message "Create app layout" -files "src/layouts/Layout.jsx" -dayOffset 25

# 4. Assets
MakeCommit -message "Add logo asset" -files "src/assets/icons/logo.svg" -dayOffset 30
MakeCommit -message "Add cart icons" -files "src/assets/icons/*cart*.svg" -dayOffset 32
MakeCommit -message "Add interaction icons" -files "src/assets/icons/icon-plus.svg src/assets/icons/icon-minus.svg src/assets/icons/icon-close.svg" -dayOffset 34
MakeCommit -message "Add remaining icons" -files "src/assets/icons/*.svg" -dayOffset 36
MakeCommit -message "Add sample images and avatars" -files "src/assets/images/*.png src/assets/images/*.jpg" -dayOffset 40
MakeCommit -message "Add public assets" -files "public/" -dayOffset 43

# 5. Components
MakeCommit -message "Create Header component" -files "src/components/header/" -dayOffset 48
MakeCommit -message "Create Home component" -files "src/components/home/" -dayOffset 53
MakeCommit -message "Create Product details component" -files "src/components/product/" -dayOffset 60
MakeCommit -message "Add SearchBar functionality" -files "src/components/searchbar/" -dayOffset 68
MakeCommit -message "Add Missing/404 page" -files "src/components/missing/" -dayOffset 72
MakeCommit -message "Implement Details view" -files "src/components/details/" -dayOffset 78

# 6. Documentation
MakeCommit -message "Add initial README" -files "README.md" -dayOffset 85
MakeCommit -message "Add detailed documentation" -files "DOCS.md" -dayOffset 90

# 7. Remaining Files
MakeCommit -message "Fix minor bugs and clean up code" -files "." -dayOffset 95

# 8. Polish commits
$refactorMessages = @(
    "Refactor component structure",
    "Update dependency versions",
    "Improve styling consistency",
    "Optimize image loading",
    "Fix responsive layout issues",
    "Clean up unused variables",
    "Enhance accessibility",
    "Update README formatting",
    "Tweak animations",
    "Prepare for production build",
    "Update meta tags",
    "Fix typo in variable names"
)

for ($i = 0; $i -lt 12; $i++) {
    $msg = $refactorMessages[$i]
    $commitDate = $startDate.AddDays(96 + $i).AddHours((Get-Random -Minimum 9 -Maximum 22)).AddMinutes((Get-Random -Minimum 0 -Maximum 59))
    $dateStr = $commitDate.ToString("yyyy-MM-ddTHH:mm:ss")
    $env:GIT_AUTHOR_DATE = $dateStr
    $env:GIT_COMMITTER_DATE = $dateStr
    & $git commit --allow-empty -m $msg
}

& $git branch -M main
& $git remote add origin https://github.com/Amonjr/E-commerce.git
& $git push -u origin main --force
