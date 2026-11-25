---
theme: seriph
background: https://images.unsplash.com/photo-1558494949-ef010cbdcc31?w=1920&q=80
class: text-center
highlighter: shiki
lineNumbers: false
transition: slide-left
mdc: true
title: "Cours 1 — DevSecOps : Introduction & Philosophie DevOps"
info: |
  ## DevSecOps — Université de Rennes / IRISA / DiverSE
  Cours 1 : Introduction DevSecOps & Philosophie DevOps
  Olivier Barais
pdf: true
export: true
drawings:
  persist: false
# slide transition: https://sli.dev/guide/animations.html#slide-transitions
# enable Comark Syntax: https://comark.dev/syntax/markdown
comark: true
download: true
---

# DevSecOps

## Cours 1 — Introduction & Philosophie DevOps

<div class="mt-8 text-xl opacity-80">
Université de Rennes · IRISA / DiverSE
</div>

<div class="mt-2 text-base opacity-60">
Olivier Barais — d'après les travaux de B. Combemale
</div>




---
layout: two-cols-header
layoutClass: my-slide
---

# Pourquoi, en tant que RSSI, comprendre les pratiques DevOps ?

::left::

<div class="mt-1 space-y-1">

<div v-click class="p-0.5 border-l-4 border-blue-400 bg-blue-900/20 rounded-r-lg">

**🗣️ Parler le langage de l'équipe technique**

La sécurité ne s'impose pas d'en haut. Pour faire adopter des pratiques (sécurité, traçabilité, reprise sur faute), le RSSI doit **comprendre le quotidien des équipes** : leur pipeline, leurs outils, leurs contraintes, leurs rythmes.

</div>

<div v-click class="p-0.5 border-l-4 border-emerald-400 bg-emerald-900/20 rounded-r-lg">

**🛠️ Intégrer la sécurité, pas l'ajouter**

Des exigences imposées *« à côté »* du travail créent de la **friction** et finissent contournées. Intégrées au workflow existant, elles deviennent des **habitudes durables**.

</div>

<div v-click class="p-2 border-l-4 border-purple-400 bg-purple-900/20 rounded-r-lg">

**🎯 Agir au bon endroit (shift-left)**

Le coût et l'impact d'une mesure dépendent de **l'endroit** où elle s'applique. Or, tout passe par le **pipeline de production logicielle** — le point de contrôle unique de l'équipe.

</div>

</div>

::right::

<div class="mt-6 text-center">

<div class="p-5 bg-gray-100 rounded-xl border border-gray-600 max-w-xs mx-auto">

<div class="text-5xl mb-3">🧭</div>

<div class="text-base font-bold">Comprendre pour convaincre,<br/>intégrer pour adopter</div>

</div>

<div v-click class="mt-1 p-0.5 bg-indigo-900/20 rounded-lg text-sm">

Le RSSI efficace **ne formule pas des interdits** : il rend les bonnes pratiques **indolores** et les fait porter par le pipeline.

</div>

</div>


<style>
/* style.css */
.slidev-layout.two-cols-header {
  grid-template-columns: 4fr 2fr;
}
li {
  font-size: 1em;
}
h1 {
  font-size: 1.6em;
}
p {
  font-size: 0.9em;
    padding:0.4em;
  margin-top: 0em;
  margin-bottom: 0em;

}

</style>

---
layout: two-cols-header
layoutClass: practices-slide
---

# Les pratiques DevOps : des leviers pour vos objectifs de RSSI

::left::

<div class="mt-1 space-y-3">

<div v-click class="p-1 border-l-4 border-red-400 bg-red-900/20 rounded-r-lg">

**🔒 Sécurité**

Revue de code dans les **pull requests**, analyse de **dépendances** &amp; **SBOM**, gestion des **secrets**, durcissement de l'image finale.

</div>

<div v-click class="p-1 border-l-4 border-green-400 bg-green-900/20 rounded-r-lg">

**📜 Traçabilité**

**Git** &amp; historique des changements, **provenance** des artefacts, **logs de CI/CD** auditables : on sait *qui*, *quoi*, *quand*.

</div>

<div v-click class="p-3 border-l-4 border-yellow-400 bg-yellow-900/20 rounded-r-lg">

**♻️ Reprise sur faute**

Versions **immuables**, **builds reproductibles**, rollback rapide, **Infrastructure as Code** : on se reconstruit proprement après un incident.

</div>

</div>

::right::

<div class="mt-6 text-center">

<div class="p-5 bg-gray-100 rounded-xl border border-gray-600 max-w-xs mx-auto">

<div class="text-5xl mb-3">🔁</div>

<div class="text-base font-bold">La même chaîne sert<br/>production <em>et</em> sécurité</div>

</div>

<div v-click class="mt-5 p-4 bg-indigo-900/20 rounded-lg text-sm">

Comprendre ces pratiques, c'est pouvoir **les faire adopter**, **les auditer** et **réagir vite** — y compris quand le *pipeline lui-même* devient une cible (SolarWinds, XZ Utils…).

</div>

</div>


<style>
/* style.css */
.slidev-layout.two-cols-header {
  grid-template-columns: 4fr 2fr;
}
li {
  font-size: 1em;
}
h1 {
  font-size: 1.6em;
}
p {
  font-size: 0.9em;
}
</style>


---

# Le modèle traditionnel de développement

<div class="flex justify-center mt-1 mb-1">
<img src="/traditional_model.png" class="max-h-36 rounded" />
</div>

<div class="mt-2">

```mermaid {scale: 0.65}
graph LR
    A[👥 Clients<br/>Désir d'innovation<br/>rapide et continue] -->|Requirements| B[📋 Line of<br/>Business]
    B -->|1er GAP ⚡| C[👨‍💻 Équipe Dev<br/>Développement<br/>Agile]
    C -->|2ème GAP ⚡| D[🖥️ Équipe Ops<br/>Opérations<br/>Traditionnelles]

    style B fill:#3b82f6,color:#fff
    style C fill:#8b5cf6,color:#fff
    style D fill:#10b981,color:#fff
    style A fill:#374151,color:#fff
```

</div>

<div class="grid grid-cols-2 gap-4 mt-3">

<div v-click class="p-2 bg-red-900/20 border border-red-400/30 rounded-lg text-sm">

**Le 1er fossé** — entre les besoins métier et ce que les développeurs produisent.

</div>

<div v-click class="p-2 bg-orange-900/20 border border-orange-400/30 rounded-lg text-sm">

**Le 2ème fossé** — entre ce que les développeurs livrent et ce que les opérations déploient et maintiennent.

</div>

</div>

<div v-click class="mt-2 grid grid-cols-2 gap-4 text-sm">
<div class="p-2 bg-blue-900/20 rounded italic text-center">"We should quickly put it in production!"</div>
<div class="p-2 bg-orange-900/20 rounded italic text-center">"Do not confuse speed and haste. Production is serious!"</div>
</div>

---
layout: center
class: text-center
---

# La tension structurelle entre Dev et Ops

<div class="flex justify-center mb-2">
<img src="/meme_ops_problem.jpg" class="max-h-36 rounded" />
</div>

<div class="grid grid-cols-2 gap-8 mt-2 max-w-3xl mx-auto">

<div class="p-4 bg-blue-900/30 border border-blue-400/40 rounded-xl">

### 👨‍💻 Dev
*veut livrer vite*

Nouvelles features · Changements fréquents · "Ça marche chez moi"

</div>

<div class="p-4 bg-green-900/30 border border-green-400/40 rounded-xl">

### 🖥️ Ops
*veut la stabilité*

Zero downtime · Pas de surprises · "La prod c'est sacré"

</div>

</div>

<div class="mt-5 text-3xl font-bold text-red-400">
"Worked fine in DEV.<br>OPS PROBLEM NOW."
</div>

<div class="mt-4 text-sm opacity-50">
Ce conflit d'objectifs est <strong>structurel</strong> dans le modèle traditionnel.
</div>

---
layout: center
class: text-center
---

# Qu'est-ce que DevOps ?

<div class="mt-10 text-3xl leading-relaxed max-w-2xl mx-auto">

*"A <strong>software engineering practice</strong>*  
*that aims at unifying*  
<br>
***software development** (Dev)*  
*and **software operation** (Ops)."*

</div>

<div class="mt-10 p-4 bg-white/10 rounded-xl text-base max-w-xl mx-auto">
DevOps a été initialement formalisé par <strong>Patrick Debois</strong> en 2009,  
lors de la conférence <em>Velocity</em> de O'Reilly :  
<em>"10+ Deploys Per Day: Dev and Ops Cooperation at Flickr"</em>
</div>

---
layout: image-right
image: /devops_infinity_loop.png
backgroundSize: contain
---

# La boucle infinie du DevOps

Le symbole **∞** représente le flux ininterrompu entre Dev et Ops :

**Côté Dev (bleu) :**
- Plan → Code → Build → Test

**Côté Ops (orange) :**
- Release → Deploy → Operate → Monitor

<div class="mt-4 p-3 bg-blue-900/20 border border-blue-400/30 rounded-lg">

Le retour d'information (**feedback**) remonte en permanence d'Ops vers Dev.  
C'est ce flux continu qui **élimine les silos**.

</div>

<div class="mt-3 text-xs opacity-40">
© Wikimedia Commons — DevOps toolchain
</div>

---

# Pourquoi DevOps ? Les motivations

<div class="grid grid-cols-2 gap-6 mt-6">

<div v-click class="p-4 border border-blue-500/40 rounded-lg">

### 🚀 Réduire le cycle de livraison
*time to market, lead time between fixes…*

Du commit à la production **le plus vite possible** et en toute confiance.

</div>

<div v-click class="p-4 border border-green-500/40 rounded-lg">

### 🧩 Approche fragmentée
*small increments vs. big bang*

Livrer souvent et en petites quantités réduit le risque et permet d'apprendre vite.

</div>

<div v-click class="p-4 border border-purple-500/40 rounded-lg">

### 🔄 Mises à jour transparentes
*seamless updates*

Les utilisateurs ne "sentent" pas les déploiements. Zero downtime devient la norme.

</div>

<div v-click class="p-4 border border-orange-500/40 rounded-lg">

### 🤝 Responsabilités partagées
*all in the same boat*

Dev et Ops partagent les objectifs, les métriques et **les responsabilités**.

</div>

</div>

---

# Responsabilités : Avant vs. Après DevOps

<div class="grid grid-cols-2 gap-6 mt-4">

<div class="text-center">
<img src="/responsibilities_before.png" class="max-h-52 mx-auto rounded" />
<div class="text-xs opacity-50 mt-1">Pre-DevOps — silos séparés</div>
</div>

<div class="text-center">
<img src="/responsibilities_after.jpg" class="max-h-52 mx-auto rounded" />
<div class="text-xs opacity-50 mt-1">Post-DevOps — responsabilités partagées</div>
</div>

</div>

<div class="mt-4 p-3 border border-green-400/40 rounded-lg text-center bg-green-900/10">

> *"You build it, You run it."* — **Werner Vogels**, Amazon CTO

</div>

---
layout: section
---

# Les 3 Voies fondamentales

## *The Three Ways* — Gene Kim, The DevOps Handbook

---

# DevOps : 3 Principes Fondamentaux

<div class="flex justify-center mb-2">
<img src="/three_ways_all.png" class="max-h-40 rounded" />
</div>

<div class="grid grid-cols-3 gap-3 mt-2">

<div v-click class="p-3 bg-blue-900/30 border border-blue-400/40 rounded-xl text-center">

**1️⃣ System Thinking**  
*Pensée systémique*

Flux fluide de Dev vers Ops. Optimiser le **système entier**.

`Business → Dev → Ops → Client`

</div>

<div v-click class="p-3 bg-green-900/30 border border-green-400/40 rounded-xl text-center">

**2️⃣ Amplify Feedback**  
*Boucles de retour*

Feedback **rapide et constant** d'Ops vers Dev. Les problèmes remontent à la source.

`Ops ⟵ Feedback ⟵ Dev`

</div>

<div v-click class="p-3 bg-purple-900/30 border border-purple-400/40 rounded-xl text-center">

**3️⃣ Continual Learning**  
*Apprentissage continu*

Connaissance individuelle → **connaissance organisationnelle**.

`Dev ↔ Ops ↻ Learn`

</div>

</div>

<div class="mt-2 text-center text-xs opacity-50">
Gene Kim — <em>The DevOps Handbook</em>
</div>

---

# 1ère Voie : La Pensée Systémique

**Objectif :** Flux de travail fluide et rapide de Dev vers Ops.

<v-clicks>

- **Rendre le travail visible** *(tableau visuel, lead time)*
- **Limiter le Work In Progress** — *"Stop starting. Start finishing."*
- **Réduire la taille des lots** et les intervalles de travail
- **Identifier et élever les contraintes** du système
- **Éliminer les obstacles et le gaspillage** dans le flux de valeur

</v-clicks>

```mermaid {scale: 0.6}
---
config:
  layout: dagre
  flowchart:
    rankSpacing: 20
    nodeSpacing: 20
    padding: 8
---
graph LR
    Business -->|Requirements| Dev
    Dev -->|Code| Build
    Build -->|Tests| Test
    Test -->|Release| Ops
    Ops -->|Deploy| Prod[Production]
    Prod -->|Valeur| Customer[👥 Client]

    style Business fill:#374151,color:#fff
    style Customer fill:#374151,color:#fff
    style Prod fill:#10b981,color:#fff
```

<div v-click class="mt-2 p-2 bg-blue-900/20 border border-blue-400/30 rounded-lg text-sm">
💡 Si Ops est un goulot d'étranglement, accélérer Dev ne sert à rien. Optimiser la contrainte d'abord.
</div>

---

# 2ème Voie : Amplifier les Boucles de Retour

<div class="grid grid-cols-2 gap-8 mt-4">

<div>

**Objectif :** Feedback rapide et constant de Ops vers Dev.

<v-clicks>

- **Travailler en sécurité** dans des systèmes complexes
- **Voir les problèmes** au moment où ils surviennent
- **Essaimer et résoudre** pour construire de la connaissance
- **Pousser la qualité vers la source** *(shift left)*
- **Optimiser** pour les centres de travail en aval

</v-clicks>

</div>

<div>

```mermaid {scale: 0.7}
graph LR
    Dev -->|code| Ops
    Ops -->|"feedback\n⚡ rapide"| Dev

    style Dev fill:#3b82f6,color:#fff
    style Ops fill:#10b981,color:#fff
```

<div class="mt-4 space-y-2 text-sm">

<div v-click class="p-2 bg-red-900/20 rounded">
❌ <b>Sans feedback :</b> bug découvert 3 mois après, contexte perdu, correction coûteuse
</div>

<div v-click class="p-2 bg-green-900/20 rounded">
✅ <b>Avec feedback :</b> problème détecté en minutes, correction ciblée et économique
</div>

</div>
</div>
</div>

---
layout: two-cols-header
---

# 3ème Voie : Expérimentation et Apprentissage Continu

```mermaid {scale: 0.65}
graph LR
    Dev -->|exp.| Loop1
    Loop1 -->|apprend| Loop2
    Loop2 -->|apprend| Loop3
    Loop3 -->|apprend| Ops

    style Dev fill:#3b82f6,color:#fff
    style Ops fill:#10b981,color:#fff
    style Loop1 fill:#8b5cf6,color:#fff
    style Loop2 fill:#8b5cf6,color:#fff
    style Loop3 fill:#8b5cf6,color:#fff
```

::left::

<div>

**Objectif :** Culture d'apprentissage organisationnel permanent.

<v-clicks>

- **Culture de sécurité psychologique** (*psychological safety*)
- **Institutionnaliser l'amélioration** du travail quotidien
- **Transformer les découvertes locales** en améliorations globales
- **Injecter des patterns de résilience** dans le quotidien
- **Leaders** qui renforcent la culture d'apprentissage

</v-clicks>

</div>


::right::

<div v-click class="mt-4 p-3 bg-purple-900/20 border border-purple-400/30 rounded-lg text-sm">

✨ **Culture de l'échec constructif**
- Post-mortems **sans blâme** (blameless postmortems)
- **Game Day** : simuler des pannes pour apprendre
- **Chaos Engineering** (Netflix, Google)
- Feature flags & A/B testing

</div>



<style>
/* style.css */
.slidev-layout.two-cols-header {
  grid-template-columns: 4fr 2fr;
}
li {
  font-size: 1em;
}
</style>



---
layout: section
---

# Le cadre CALMS

## La culture DevOps en 5 piliers

---

# CALMS : Le Cadre Conceptuel DevOps

<div class="flex justify-center mb-2">
<img src="/calms_framework.png" class="max-h-28 rounded" />
</div>

<div class="grid grid-cols-1 gap-1 mt-2 text-sm">

<div v-click class="p-2 border-l-4 border-blue-400 pl-3 bg-blue-900/10 rounded-r-lg">
<strong>🧠 C — Culture :</strong> Le fondement. Sans changement culturel, les outils ne changent rien.
</div>

<div v-click class="p-2 border-l-4 border-green-400 pl-3 bg-green-900/10 rounded-r-lg">
<strong>⚙️ A — Automation :</strong> Builds, tests, déploiements, infrastructure — tout ce qui peut être automatisé doit l'être.
</div>

<div v-click class="p-2 border-l-4 border-yellow-400 pl-3 bg-yellow-900/10 rounded-r-lg">
<strong>📉 L — Lean :</strong> Éliminer le gaspillage, réduire les lots, maximiser le flux de valeur.
</div>

<div v-click class="p-2 border-l-4 border-orange-400 pl-3 bg-orange-900/10 rounded-r-lg">
<strong>📊 M — Measurement :</strong> Mesurer performances, déploiements, temps de récupération — sans mesure, pas d'amélioration.
</div>

<div v-click class="p-2 border-l-4 border-purple-400 pl-3 bg-purple-900/10 rounded-r-lg">
<strong>🔗 S — Sharing :</strong> Partager les outils, les pratiques, les succès ET les échecs entre équipes.
</div>

</div>

---

# La Culture : attributs d'une organisation DevOps

<div class="grid grid-cols-3 gap-3 mt-4 text-sm">

<div class="p-3 border border-blue-400/30 rounded-lg bg-blue-900/10">

**🏗️ Infrastructure As Code**
- Full Stack Automation
- Cloud Infrastructure APIs
- Reliability in software stack

</div>

<div class="p-3 border border-green-400/30 rounded-lg bg-green-900/10">

**🔧 Application As Services**
- Service Orientation
- Versioned APIs
- Design for Failure

</div>

<div class="p-3 border border-purple-400/30 rounded-lg bg-purple-900/10">

**👥 Dev/Ops/All As Teams**
- Shared Metrics & Monitoring
- Service Owners On-call
- CI/CD & **GameDay**

</div>

</div>

<div class="mt-3 text-sm">

| Avant DevOps | Après DevOps |
|-------------|-------------|
| Équipes séparées, silos | Équipes pluridisciplinaires, transparence |
| "C'est leur problème" | "C'est notre problème" |
| Blâme en cas d'incident | Post-mortem blameless |

</div>

---
layout: section
---

# Mesurer le succès DevOps

## Les 5 métriques DORA

---

# Les 5 Métriques DORA

<div class="grid grid-cols-2 gap-4 mt-3 items-start">

<div class="flex flex-col gap-3">
<img src="/performance_metrics_dora.png" class="max-h-44 rounded mx-auto" />

<div class="p-3 bg-blue-900/20 border border-blue-400/30 rounded-xl">

**🔧 Stabilité du service**

<div class="mt-1 space-y-1 text-sm">

<div class="px-2 py-1 bg-blue-900/30 rounded">

**Change Failure Rate** — % de changements causant panne <span class="text-xs opacity-60">(Elite : 0–15%)</span>

</div>

<div class="px-2 py-1 bg-blue-900/30 rounded">

**Time to Restore** — Temps pour restaurer après incident <span class="text-xs opacity-60">(Elite : &lt;1h)</span>

</div>



</div>
</div>

</div>

<div class="flex flex-col gap-3">

<div class="p-1 bg-green-900/20 border border-green-400/30 rounded-xl">

**🚀 Développement logiciel**

<div class="mt-0 space-y-1 text-sm">

<div class="px-2 py-1 bg-green-900/30 rounded">

**Lead Time** — Du commit au prod <span class="text-xs opacity-60">(Elite : &lt;1h)</span>

</div>

<div class="px-2 py-1 bg-green-900/30 rounded">

**Deployment Frequency** — Fréquence de déploiement <span class="text-xs opacity-60">(Elite : plusieurs/jour)</span>

</div>

</div>
</div>

<div class="p-3 bg-purple-900/20 border border-purple-400/30 rounded-xl">

**🔁 Reprise (5ᵉ métrique DORA)**

<div class="mt-1 space-y-1 text-sm">

<div class="px-2 py-1 bg-purple-900/30 rounded">

**Deployment Rework Rate** — % de déploiements non planifiés suite à un incident <span class="text-xs opacity-60">(ajoutée en 2024)</span>

</div>



</div>
</div>

</div>

</div>

<div class="mt-3 p-2 bg-yellow-900/20 rounded text-xs text-center">
📖 Source : DORA — DevOps Research and Assessment (Google) · State of DevOps Report 2024
</div>
---

# DevOps vs. Agile : Complémentaires !

<div class="flex justify-center mb-2">
<img src="/devops_vs_agile.png" class="max-h-32 rounded" />
</div>

<div class="grid grid-cols-2 gap-6 mt-2 text-sm">

<div>

**Agile**
- Itérations courtes *(sprints 2-4 semaines)*
- Feedback du client intégré
- Équipes auto-organisées

**Limite :** Agile s'arrêtait à la livraison au client interne (staging). La production restait un "mur".

</div>

<div>

**DevOps complète Agile**

- Étend le flux continu **jusqu'en production**
- **Continuous Delivery** : chaque incrément est potentiellement déployable en prod
- Partage les responsabilités **au-delà du sprint**

</div>
</div>

<div class="mt-0 p-1 bg-indigo-900/20 border border-indigo-400/20 rounded-xl text-center text-sm">

**Agile** optimise le *comment* on développe.  
**DevOps** optimise le *comment* on livre et opère.  
Ensemble, ils forment un **flux de valeur bout en bout**.

</div>

<style>
/* style.css */
.slidev-layout.two-cols-header {
  grid-template-columns: 4fr 2fr;
}
p {
  font-size: 1em;
  margin-top: 0.5em;
  margin-bottom: 0.5em;
}
</style>



---

# Les outils DevOps — Vue d'ensemble

<div class="flex justify-center mb-2">
<img src="/devops_tools_1.png" class="max-h-32 rounded" />
</div>

<div class="grid grid-cols-3 gap-3 mt-2 text-sm">

<div class="space-y-2">

**📝 Plan / Code**
- Jira, Confluence
- Git, GitHub/GitLab
- IDE + plugins

**🔨 Build**
- Maven, sbt, npm
- Gradle, Make

</div>

<div class="space-y-2">

**🧪 Test**
- JUnit, Selenium
- SonarQube
- Trivy, Snyk

**🚀 Release / Deploy**
- Jenkins, GitHub Actions
- ArgoCD, Flux
- Codeship, CircleCI

</div>

<div class="space-y-2">

**⚙️ Operate**
- Docker, Kubernetes
- Ansible, Chef, Terraform
- DC/OS, AWS

**📊 Monitor**
- Nagios, Datadog
- Splunk, Grafana
- Prometheus

</div>

</div>

<div class="mt-3 p-2 bg-blue-900/20 rounded-lg text-center text-sm">
⚠️ Ces outils seront détaillés <strong>cours par cours</strong>. Aujourd'hui : comprendre la philosophie, pas les outils.
</div>

---
layout: center
class: text-center
---

# À retenir

<div class="grid grid-cols-2 gap-6 mt-6 text-left max-w-3xl mx-auto">

<div class="p-5 bg-blue-900/30 border border-blue-400/30 rounded-xl">

### DevOps, c'est avant tout…

<v-clicks>

✅ Un mouvement **culturel et philosophique**  
✅ Briser les silos entre Dev et Ops  
✅ Responsabilités **partagées**  
✅ Feedback **rapide** et continu  
✅ **Apprentissage** organisationnel permanent

</v-clicks>

</div>

<div class="p-5 bg-red-900/20 border border-red-400/30 rounded-xl">

### DevOps, ce n'est PAS…

<v-clicks>

❌ Un outil ou un produit  
❌ Un titre de poste  
❌ Juste de l'automatisation  
❌ Agile renommé  
❌ Réservé aux grandes entreprises

</v-clicks>

</div>

</div>

<div v-click class="mt-8 p-4 bg-purple-900/30 rounded-xl max-w-2xl mx-auto">

> *"You build it, you run it."* — **Werner Vogels**, Amazon CTO

Quand ceux qui construisent sont aussi responsables de l'opération, la qualité devient une **propriété émergente** du système.

</div>

---
layout: end
---

# Questions ?

<div class="mt-8 max-w-2xl mx-auto text-left">

**Ressources :**

- 📄 **Poly du cours** : [télécharger le poly (PDF)](https://raw.githubusercontent.com/barais/devsecops.module1/refs/heads/master/poly/poly.pdf)
- ➡️ **Cours suivant — Cours 2 — Gestion de Versions & Git** : [https://olivier.barais.fr/devsecops.module2](https://olivier.barais.fr/devsecops.module2)

</div>

<div class="mt-8 text-sm opacity-50">
Olivier Barais · Module DevSecOps
</div>