// ============================================================
// Polycopié — Cours 1 : Introduction DevSecOps & Philosophie DevOps
// Université de Rennes · IRISA / DiverSE
// Olivier Barais — d'après les travaux de B. Combemale
// ============================================================

#set document(
  title: "Cours 1 — Introduction Philosophie DevOps",
  author: "Olivier Barais",
  date: datetime(year: 2026, month: 9, day: 1),
)

#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm),
  header: context {
    if counter(page).get().first() > 1 [
      #set text(size: 8pt, fill: luma(130))
      #grid(columns: (1fr, 1fr),
        [DevSecOps — Cours 1 · Université de Rennes],
        align(right)[Olivier Barais]
      )
      #line(length: 100%, stroke: 0.5pt + luma(200))
    ]
  },
  footer: context [
    #set text(size: 8pt, fill: luma(130))
    #line(length: 100%, stroke: 0.5pt + luma(200))
    #v(2pt)
    #grid(columns: (1fr, 1fr),
      [IRISA / DiverSE · 2026],
      align(right)[Page #counter(page).display("1")]
    )
  ]
)

#set text(font: "New Computer Modern", size: 10.5pt, lang: "fr")
#set par(justify: true, leading: 0.65em, spacing: 1.2em)
#set heading(numbering: "1.1")

#show heading.where(level: 1): it => {
  v(1.5em)
  block(
    fill: rgb("#1e40af"),
    radius: 4pt,
    inset: (x: 10pt, y: 6pt),
    width: 100%,
    text(fill: white, size: 14pt, weight: "bold")[#it.body]
  )
  v(0.5em)
}

#show heading.where(level: 2): it => {
  v(0.8em)
  text(size: 12pt, weight: "bold", fill: rgb("#1d4ed8"))[#it.body]
  v(0.3em)
}

#show heading.where(level: 3): it => {
  v(0.5em)
  text(size: 11pt, weight: "bold", fill: rgb("#374151"))[#it.body]
  v(0.2em)
}

// Boîte d'alerte
#let alert(color: red, icon: "⚠", body) = block(
  fill: color.lighten(90%),
  stroke: 0.8pt + color,
  radius: 4pt,
  inset: 10pt,
  width: 100%,
)[
  #text(weight: "bold")[#icon  ] #body
]

// Boîte d'exemple
#let example(title, body) = block(
  fill: rgb("#f0f9ff"),
  stroke: (left: 3pt + rgb("#0ea5e9")),
  inset: (left: 12pt, right: 10pt, top: 8pt, bottom: 8pt),
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("#0369a1"))[Exemple — #title] \
  #v(4pt)
  #body
]

// Boîte de définition
#let definition(term, body) = block(
  fill: rgb("#f5f3ff"),
  stroke: (left: 3pt + rgb("#7c3aed")),
  inset: (left: 12pt, right: 10pt, top: 8pt, bottom: 8pt),
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("#6d28d9"))[Définition — #term] \
  #v(4pt)
  #body
]

// Boîte de retenir
#let keypoint(body) = block(
  fill: rgb("#fff7ed"),
  stroke: (left: 3pt + rgb("#ea580c")),
  inset: (left: 12pt, right: 10pt, top: 8pt, bottom: 8pt),
  width: 100%,
)[
  #text(weight: "bold", fill: rgb("#c2410c"))[À retenir] \
  #v(4pt)
  #body
]

// ============================================================
// PAGE DE TITRE
// ============================================================

#align(center)[
  #v(2cm)
  #block(
    fill: rgb("#1e3a8a"),
    radius: 8pt,
    inset: 20pt,
    width: 90%,
  )[
    #text(fill: white, size: 11pt)[DevSecOps — Université de Rennes · IRISA / DiverSE]
    #v(8pt)
    #text(fill: white, size: 20pt, weight: "bold")[Cours 1]
    #v(4pt)
    #text(fill: rgb("#93c5fd"), size: 15pt)[Introduction DevSecOps \& Philosophie DevOps]
  ]

  #v(1.5cm)

  #text(size: 11pt, weight: "bold")[Olivier Barais]
  #linebreak()
  #text(size: 10pt, fill: luma(80))[Professeur des Universités · Université de Rennes]
  #linebreak()
  #text(size: 10pt, fill: luma(80))[IRISA UMR 6074 · Équipe DiverSE · INRIA]
  #linebreak()
  #text(size: 10pt, fill: luma(80))[D'après les travaux de B. Combemale]

  #v(1cm)
  #text(size: 9pt, fill: luma(100))[Année universitaire 2026–2027]

  #v(2cm)
]

#outline(
  title: "Table des matières",
  indent: 1em,
  depth: 2,
)

#pagebreak()


// ============================================================
// PHILOSOPHIE DEVOPS
// ============================================================

= La philosophie DevOps

== Le modèle traditionnel et ses limitations

=== Organisation en silos

Pendant des décennies, le développement logiciel a été organisé selon un modèle séquentiel : les équipes de développement (Dev) concevaient et codaient les fonctionnalités, puis les remettaient aux équipes d'opérations (Ops) pour le déploiement et la maintenance. Ce modèle dit « waterfall » ou « en cascade » crée deux fossés structurels :

- *Le premier fossé* sépare les besoins métier de ce que les développeurs produisent. Les cycles longs entre l'expression d'un besoin et sa livraison génèrent des décalages entre les attentes et la réalité.
- *Le second fossé* sépare ce que les développeurs livrent de ce que les opérations déploient et maintiennent. Les environnements divergent, les configurations diffèrent, et le traditionnel « ça marche chez moi » devient une source de conflit.

=== Le conflit d'objectifs structurel

Ce modèle crée un conflit d'objectifs fondamental :

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  block(
    fill: rgb("#eff6ff"),
    stroke: 1pt + rgb("#3b82f6"),
    radius: 4pt,
    inset: 10pt,
  )[
    *Équipe Dev* \
    — Livrer de nouvelles fonctionnalités rapidement \
    — Innover et expérimenter \
    — Accepter le risque du changement
  ],
  block(
    fill: rgb("#f0fdf4"),
    stroke: 1pt + rgb("#22c55e"),
    radius: 4pt,
    inset: 10pt,
  )[
    *Équipe Ops* \
    — Maintenir la stabilité de la production \
    — Éviter les incidents et les pannes \
    — Minimiser le risque du changement
  ]
)

#v(0.5em)

Ces objectifs antagonistes sont intrinsèques au modèle organisationnel, et non le résultat de mauvaise volonté individuelle. DevOps est précisément une réponse à ce conflit structurel.

== Naissance et définition du DevOps

=== Origine historique

Le terme DevOps est forgé par *Patrick Debois* en 2009, en référence à la conférence Velocity d'O'Reilly où John Allspaw et Paul Hammond ont présenté leur retour d'expérience chez Flickr @velocity-2009 : « 10+ Deploys Per Day: Dev and Ops Cooperation at Flickr ». Cette présentation démontrait qu'il était possible — et souhaitable — de déployer plusieurs fois par jour en production, à condition que Dev et Ops collaborent étroitement.

Patrick Debois a ensuite organisé la première *DevOpsDays* à Gand (Belgique) en octobre 2009, donnant naissance à une communauté mondiale.

#definition("DevOps")[
  DevOps est une *pratique d'ingénierie logicielle* qui vise à unifier le développement logiciel (*Dev*) et les opérations informatiques (*Ops*). Son objectif est de raccourcir le cycle de vie du développement tout en livrant des fonctionnalités, des correctifs et des mises à jour de manière fréquente, fiable et sécurisée.
]

DevOps n'est ni un outil, ni un titre de poste, ni une méthodologie prescriptive. C'est avant tout un *mouvement culturel* qui repose sur des principes de collaboration, de partage des responsabilités et d'amélioration continue.

=== La boucle infinie

Le symbole visuel du DevOps est une boucle infinie (∞) représentant le flux continu entre les deux grandes phases :

- *Côté Dev (plan → code → build → test)* : les activités de conception et de construction.
- *Côté Ops (release → deploy → operate → monitor)* : les activités de livraison et d'exploitation.

Le feedback remonte en permanence d'Ops vers Dev — les métriques de production informent les décisions de développement, et les alertes d'exploitation génèrent des correctifs immédiats.

// ============================================================
// LES TROIS VOIES
// ============================================================

= Les Trois Voies (*The Three Ways*)

Gene Kim, co-auteur de _The DevOps Handbook_ @devops-handbook, a formalisé les principes sous-jacents du DevOps sous la forme des *Trois Voies* @three-ways. Ces principes ne décrivent pas des pratiques concrètes mais les *valeurs* qui guident les équipes DevOps performantes.

== Première Voie : La Pensée Systémique

=== Principe

La première voie consiste à optimiser le *système entier* plutôt que des silos locaux. Elle s'inspire directement de la *Théorie des Contraintes* (Theory of Constraints) d'Eliyahu Goldratt : toute chaîne de valeur n'est pas plus rapide que son maillon le plus lent.

#keypoint[
  Accélérer le développement sans résoudre le goulot d'étranglement des opérations ne réduit pas le temps de livraison global — cela augmente simplement la file d'attente en amont du goulot.
]

=== Pratiques concrètes associées

- *Rendre le travail visible* : tableaux Kanban, lead time metrics, value stream mapping.
- *Limiter le Work In Progress (WIP)* : réduire le nombre de tâches parallèles pour finir ce qui est commencé plutôt que d'en démarrer de nouvelles.
- *Réduire la taille des lots* : livrer de petits incréments fréquemment plutôt que de grandes releases rares et risquées.
- *Identifier et lever les contraintes* : instrumenter la pipeline pour localiser les étapes lentes.
- *Éliminer le gaspillage* : supprimer les étapes manuelles répétitives, les allers-retours, les files d'attente.

#example("Réduction de la taille des lots chez Amazon")[
  Amazon est passé de déploiements mensuels à plusieurs milliers de déploiements par jour. Chaque déploiement ne concerne qu'une seule fonctionnalité ou correctif, ce qui rend le diagnostic d'incident trivial (il suffit d'identifier le dernier changement) et le rollback immédiat.
]

== Deuxième Voie : Amplifier les Boucles de Retour

=== Principe

La deuxième voie consiste à créer des *boucles de feedback rapides* allant d'Ops vers Dev — c'est-à-dire à faire remonter les problèmes de production vers leur source le plus vite possible. Dans le modèle traditionnel, un bug découvert trois mois après sa mise en production demande des heures pour reconstituer le contexte de sa création. Avec un feedback en temps quasi-réel, le développeur qui a introduit le problème peut le corriger en minutes, dans son contexte de travail.

=== Pratiques concrètes associées

- *Tests automatisés* à chaque commit : unitaires, d'intégration, de sécurité (SAST, SCA).
- *Déploiements canary et blue/green* : exposition progressive des changements pour détecter les régressions avant impact total.
- *Monitoring et observabilité* : logs structurés, traces distribuées, métriques métier en temps réel.
- *Alerting intelligent* : distinguer les alertes actionnables du bruit.
- *Shift left* : déplacer les vérifications (tests, sécurité) le plus tôt possible dans le cycle de développement.

#example("Shift Left en sécurité")[
  Plutôt que d'effectuer un pentest annuel en fin de cycle de développement, une équipe DevSecOps intègre des outils d'analyse de dépendances (Dependabot, Snyk, Trivy) directement dans la pipeline CI/CD. Chaque pull request est analysée pour détecter des vulnérabilités connues avant la fusion dans la branche principale.
]

== Troisième Voie : Culture d'Expérimentation et d'Apprentissage Continu

=== Principe

La troisième voie transforme les connaissances individuelles en *capital organisationnel*. Elle crée une culture où l'expérimentation est encouragée, où l'échec est vécu comme une opportunité d'apprentissage plutôt que comme une faute, et où les leçons tirées d'un incident sont partagées et codifiées pour améliorer le système.

=== Pratiques concrètes associées

- *Post-mortems sans blâme* (blameless postmortems) : analyser les incidents sans chercher un coupable mais en cherchant les causes systémiques.
- *Game Day* : simuler délibérément des pannes en production pour tester les procédures de réponse.
- *Chaos Engineering* : introduire du dysfonctionnement aléatoire (Chaos Monkey de Netflix) pour construire de la résilience.
- *Feature flags* : activer/désactiver des fonctionnalités sans redéploiement pour des tests A/B et des rollbacks instantanés.
- *Documentation vivante* : runbooks, playbooks et décisions architecturales maintenues à jour.

#example("Chaos Engineering chez Netflix")[
  Netflix a développé Chaos Monkey en 2011 — un outil qui éteint aléatoirement des serveurs de production pendant les heures de bureau. L'objectif était de construire des services suffisamment résilients pour supporter ces pannes sans interruption pour les utilisateurs. Cette pratique a permis à Netflix de maintenir une disponibilité supérieure à 99,99 % malgré une infrastructure distribuée complexe.
]

// ============================================================
// CALMS
// ============================================================

= Le cadre CALMS

Le cadre *CALMS* — initialement *CAMS* (Culture, Automation, Measurement, Sharing), introduit par John Willis et Damon Edwards @calms-definition et complété par le *L* de *Lean* par Jez Humble — offre une grille de lecture pour évaluer et décrire la maturité DevOps d'une organisation. Il identifie cinq piliers interdépendants.

== C — Culture

La culture est le fondement de DevOps. Sans changement culturel, même les meilleurs outils ne produiront pas les résultats attendus. Une culture DevOps se caractérise par :

- *La collaboration* entre Dev et Ops comme norme, et non comme exception.
- *La responsabilité partagée* : « You build it, you run it » (Werner Vogels, CTO d'Amazon).
- *La transparence* : les métriques de performance sont visibles par tous.
- *La confiance* : les équipes ont le droit de prendre des décisions et d'expérimenter.

La culture d'une organisation DevOps peut être évaluée via le modèle de Westrum (pathologique → bureaucratique → générative), souvent corrélé avec les performances mesurées par DORA @accelerate.

== A — Automation

L'automatisation est le vecteur opérationnel par lequel les principes culturels se traduisent en gains concrets. Tout ce qui est répétitif, manuel et sujet à l'erreur humaine doit être automatisé :

- *Builds reproductibles* : le même code doit produire le même artefact à chaque exécution.
- *Tests automatisés* : unitaires, intégration, end-to-end, sécurité.
- *Infrastructure as Code (IaC)* : Terraform, Ansible, Helm — l'infrastructure est versionnée et auditée comme du code.
- *Déploiements automatisés* : pipelines CI/CD qui déploient sans intervention humaine après validation des tests.

== L — Lean

DevOps s'inscrit dans la tradition du *Lean manufacturing* (Toyota Production System). Les principes Lean appliqués au logiciel incluent :

- Éliminer le *gaspillage* (travail non valorisé, retards, rework).
- Réduire les *lots de travail* pour accélérer le flux.
- Identifier et résoudre les *goulots d'étranglement*.
- Favoriser le *flux tiré* (pull) plutôt que le flux poussé (push).

== M — Measurement

« You can't manage what you can't measure. » Sans mesure, l'amélioration reste une intuition. Les métriques DevOps doivent couvrir à la fois les aspects techniques et les impacts métier :

- Métriques DORA (voir section suivante).
- *Mean Time to Recovery (MTTR)* et *Mean Time Between Failures (MTBF)*.
- *Couverture de tests* et taux de faux positifs.
- *Délai de déploiement* bout en bout.

== S — Sharing

Le partage, à la fois des outils, des pratiques, des succès et surtout des *échecs*, est ce qui transforme un apprentissage local en amélioration globale de l'organisation. Cela inclut :

- Communautés de pratique inter-équipes.
- Inner source : application des principes open source à l'intérieur de l'organisation.
- Partage des post-mortems et des playbooks d'incident.

// ============================================================
// DORA
// ============================================================

= Les métriques DORA

Le programme *DevOps Research and Assessment* (DORA), fondé par Nicole Forsgren, Jez Humble et Gene Kim, a mené des recherches longitudinales sur les performances des équipes de livraison logicielle depuis 2013. Leurs travaux, synthétisés dans le livre _Accelerate_ @accelerate et le rapport annuel _State of DevOps_ @state-of-devops-2023, ont identifié quatre métriques qui prédisent de manière fiable les performances organisationnelles globales.

== Les quatre métriques

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  block(fill: rgb("#f0fdf4"), stroke: 1pt + rgb("#16a34a"), radius: 4pt, inset: 10pt)[
    *Métriques de débit (throughput)*

    *Lead Time for Changes* \
    Temps entre le premier commit et le déploiement en production. Mesure la réactivité de la pipeline.

    *Deployment Frequency* \
    Fréquence à laquelle le code est déployé en production. Indicateur de la maturité CI/CD.
  ],
  block(fill: rgb("#eff6ff"), stroke: 1pt + rgb("#2563eb"), radius: 4pt, inset: 10pt)[
    *Métriques de stabilité*

    *Change Failure Rate* \
    Pourcentage de déploiements causant un incident en production. Mesure la qualité.

    *Time to Restore Service* \
    Temps pour restaurer le service après un incident. Mesure la résilience.
  ]
)

Aux quatre métriques historiques — les *four keys* —, DORA a ajouté en 2024 une cinquième métrique, le *deployment rework rate* : la part des déploiements non planifiés, déclenchés par un incident de production. Les cinq métriques sont désormais regroupées en deux facteurs : le *throughput* (la rapidité : change lead time, deployment frequency, failed deployment recovery time) et l'*instability* (la stabilité : change fail rate, deployment rework rate) @dora-metrics.

== Les niveaux de performance DORA (rapport 2023)

#figure(
  table(
    columns: (auto, 1fr, 1fr, 1fr, 1fr),
    stroke: 0.5pt + luma(200),
    fill: (_, row) => if row == 0 { rgb("#1e3a8a") } else if calc.rem(row, 2) == 0 { luma(245) } else { white },
    table.header(
      text(fill: white)[*Niveau*],
      text(fill: white)[*Lead Time*],
      text(fill: white)[*Deploy Freq.*],
      text(fill: white)[*CFR*],
      text(fill: white)[*Recovery*],
    ),
    [Elite], [< 1 jour], [Sur demande], [5 %], [< 1 heure],
    [High], [1 jour – 1 semaine], [1×/jour – 1×/semaine], [10 %], [< 1 jour],
    [Medium], [1 semaine – 1 mois], [1×/semaine – 1×/mois], [15 %], [1–7 jours],
    [Low], [1 semaine – 1 mois], [1×/semaine – 1×/mois], [64 %], [1 mois – 6 mois],
  ),
  caption: [Niveaux de performance DORA — Accelerate State of DevOps Report 2023]
)

#keypoint[
  Les organisations de niveau Elite déploient *sur demande*, contre environ une fois par semaine pour le niveau Low, et restaurent un déploiement échoué en moins d'une heure, là où le niveau Low met un à six mois. Leur taux d'échec des changements est d'environ 5 %, contre 64 % pour les organisations les moins performantes @state-of-devops-2023. Ces écarts sont corrélés avec la performance commerciale globale de l'organisation.
]

== Implications pour la sécurité

Un résultat contre-intuitif mais robuste des études DORA : *la vitesse et la stabilité ne sont pas antagonistes*. Les organisations qui déploient le plus fréquemment ont aussi les taux d'échec les plus bas. La raison est simple : des déploiements petits et fréquents sont moins risqués que des releases rares et volumineuses, et facilitent l'intégration précoce des correctifs de sécurité.

// ============================================================
// DEVOPS ET AGILE
// ============================================================

= DevOps et Agile : complémentaires, pas concurrents

== Les origines d'Agile

Le Manifeste Agile (2001) a représenté une rupture avec le modèle waterfall en proposant des itérations courtes (sprints de 2 à 4 semaines), un feedback continu du client, des équipes auto-organisées et une amélioration continue des pratiques. Des frameworks comme Scrum, Kanban et XP ont opérationnalisé ces principes.

La limite historique d'Agile était cependant une *limite de périmètre* : il s'appliquait au développement, mais s'arrêtait à la livraison au client *interne* (staging). La production restait un territoire séparé, géré par une équipe distincte avec ses propres processus.

== Ce que DevOps apporte à Agile

DevOps *étend* Agile jusqu'en production :

- Chaque incrément livré par un sprint est potentiellement déployable en production immédiatement (*Continuous Delivery*).
- Les métriques de production (erreurs, latence, utilisation) alimentent directement le backlog du sprint suivant.
- Les opérations participent aux cérémonies Agile et co-définissent les critères d'acceptation.
- Le concept de *Definition of Done* inclut : déployé en production et monitoré.

#example("Continuous Delivery vs. Continuous Deployment")[
  *Continuous Delivery (CD)* : chaque commit, après validation de tous les tests, produit un artefact prêt à être déployé en production. Le déploiement final reste une décision humaine (un clic). \
  *Continuous Deployment* : chaque commit validé est automatiquement déployé en production sans intervention humaine. Utilisé par des entreprises comme Etsy, Netflix, Facebook.
]

// ============================================================
// VUE D'ENSEMBLE DES OUTILS
// ============================================================

= Vue d'ensemble des outils DevOps

Les outils DevOps s'organisent selon les phases de la chaîne de valeur. Cette section présente un panorama général ; chaque outil sera étudié en détail dans les cours suivants.

#figure(
  table(
    columns: (auto, 1fr, 1fr),
    stroke: 0.5pt + luma(200),
    fill: (_, row) => if row == 0 { rgb("#374151") } else if calc.rem(row, 2) == 0 { luma(248) } else { white },
    table.header(
      text(fill: white)[*Phase*],
      text(fill: white)[*Outils représentatifs*],
      text(fill: white)[*Objet du cours*],
    ),
    [Plan / Code],     [Git, GitHub, GitLab, Jira, Confluence],      [Cours 2 — Git & GitFlow],
    [Dépendances],     [npm, pip, Maven, Gradle, Dependabot, Snyk],  [Cours 3],
    [Build / CI],      [GitHub Actions, Jenkins, GitLab CI, CircleCI],[Cours 4],
    [Conteneurisation],[Docker, Podman, Docker Hub, Trivy],           [Cours 5],
    [CD / Deploy],     [ArgoCD, Flux, Helm, Kubernetes],              [Cours 4–5],
    [Sécurité SAST],   [SonarQube, Semgrep, CodeQL],                  [Cours 6–7],
    [SBOM],            [Syft, CycloneDX, SPDX, Grype],               [Cours 8],
    [Monitor],         [Prometheus, Grafana, Datadog, Splunk],        [Cours 4],
  ),
  caption: [Vue d'ensemble des outils DevOps par phase — programme de l'UE]
)

#alert(color: rgb("#0369a1"), icon: "ℹ")[
  L'objectif de ce premier cours n'est pas de maîtriser ces outils mais de comprendre *pourquoi* ils existent et quelle philosophie ils servent. La maîtrise technique viendra dans les cours suivants.
]

// ============================================================
// SYNTHÈSE
// ============================================================

= La supply chain logicielle : une surface d'attaque

Le développement modernisé par DevOps s'appuie sur une *chaîne d'approvisionnement logicielle* : dépendances tierces, registres de paquets, pipelines CI/CD, artefacts signés. Chaque maillon de cette chaîne est une cible potentielle. Quatre incidents illustrent pourquoi la sécurité doit s'intégrer directement dans ces mécanismes.

== event-stream (2018)

En 2018, le paquet JavaScript `event-stream` — très populaire, avec des millions de téléchargements — a été compromis par son nouveau mainteneur, qui y a ajouté une dépendance malveillante, `flatmap-stream`. Le code malveillant ciblait le portefeuille de cryptomonnaie Copay (BitGo) pour en dérober les clés privées @event-stream-incident. Un maillon unique de la chaîne a permis d'atteindre des milliers d'utilisateurs.

== node-ipc / peacenotwar (2022)

En mars 2022, le développeur du paquet `node-ipc` a publié une mise à jour contenant le module `peacenotwar`, une protestation contre l'invasion de l'Ukraine : sur les machines dont la géolocalisation désignait la Russie ou la Biélorussie, il écrasait les fichiers avec un cœur et un message pacifiste @node-ipc-snyk. L'impact — destructif pour certains utilisateurs — illustre le risque des dépendances malveillantes volontaires dans les registres de paquets.

== SolarWinds Orion (2020)

En 2020, l'outil d'administration Orion de SolarWinds a été compromis avant sa diffusion : un acteur APT (attribué à la Russie) a inséré une porte dérobée dans le produit, livrée aux clients par le mécanisme de mise à jour légitime @solarwinds-cisa. Environ 18 000 organisations, dont des agences gouvernementales américaines, ont installé la version compromise. C'est la compromission la plus emblématique d'une chaîne d'approvisionnement logicielle.

== Hallucinations d'IA et squatting de paquets (2023)

Parallèlement, les assistants de code fondés sur l'IA générative recommandent parfois des paquets qui n'existent pas — des *hallucinations* de paquets. Un attaquant peut alors enregistrer ces noms pour distribuer du code malveillant aux développeurs qui suivent aveuglément la recommandation @ai-hallucination-packages. C'est une nouvelle voie de compromission de la supply chain, amplifiée par l'adoption croissante de l'IA dans le développement.

#keypoint[
  Compromettre un maillon unique de la chaîne — une dépendance, un registre, un pipeline — permet d'atteindre des milliers de victimes simultanément. C'est pourquoi la sécurité doit être intégrée dès chaque étape du pipeline DevOps (*shift left*), et pas seulement vérifiée en fin de cycle.
]

= Synthèse et points clés

Ce premier cours a posé les bases conceptuelles de l'UE DevSecOps. Les points essentiels à retenir sont les suivants.

== DevOps est avant tout une philosophie

DevOps n'est pas un outil, un titre de poste ou une simple extension d'Agile. C'est un *mouvement culturel* visant à réconcilier vitesse de livraison et stabilité opérationnelle, en brisant les silos organisationnels entre développement et opérations.

== La supply chain logicielle est une surface d'attaque

Les quatre incidents étudiés dans la section précédente — `event-stream`, `node-ipc`, SolarWinds et les hallucinations LLM — illustrent que les attaquants ciblent désormais préférentiellement la *chaîne d'approvisionnement logicielle* plutôt que les applications elles-mêmes. Compromettre un maillon unique de cette chaîne permet d'atteindre des milliers de victimes simultanément.

== Les Trois Voies structurent la pensée DevOps

Les principes de Gene Kim offrent un cadre conceptuel cohérent : optimiser le système entier (1ère voie), amplifier les boucles de feedback (2ème voie), et institutionnaliser l'apprentissage (3ème voie). Ces trois voies se retrouvent dans toutes les pratiques DevOps concrètes.

== La mesure est indispensable

Les métriques DORA fournissent des indicateurs objectifs et scientifiquement validés pour évaluer la maturité d'une organisation. Sans mesure, l'amélioration reste une intuition.

#keypoint[
  *« You build it, you run it. »* — Werner Vogels, CTO d'Amazon.

  Quand les équipes qui construisent le logiciel sont aussi responsables de son exploitation, la qualité — y compris la sécurité — devient une propriété émergente du système.
]

// ============================================================
// BIBLIOGRAPHIE
// ============================================================

#pagebreak()

= Références et pour aller plus loin

== Ouvrages fondamentaux

- *Gene Kim, Jez Humble, Patrick Debois, John Willis* — _The DevOps Handbook_ (2016, IT Revolution Press). La référence principale du cours. Couvre les Trois Voies, les pratiques CI/CD, la sécurité intégrée et les études de cas.

- *Nicole Forsgren, Jez Humble, Gene Kim* — _Accelerate_ (2018, IT Revolution Press). Présente les bases scientifiques des métriques DORA et démontre le lien entre pratiques DevOps et performance organisationnelle.

- *Gene Kim, Kevin Behr, George Spafford* — _The Phoenix Project_ (2013, IT Revolution Press) @phoenix-project. Roman qui met en scène les principes DevOps dans un contexte fictif d'entreprise — lecture recommandée pour comprendre les dynamiques humaines et organisationnelles.

- *Jez Humble, David Farley* — _Continuous Delivery_ (2010, Addison-Wesley) @continuous-delivery. Le livre fondateur des pratiques de livraison continue, encore d'actualité.

== Rapports et ressources en ligne

- *DORA — State of DevOps Report 2023* : #link("https://dora.dev/research/2023/dora-report/")
- *OpenSSF — Securing the Open Source Ecosystem* : #link("https://openssf.org")
- *SLSA — Supply-chain Levels for Software Artifacts* : #link("https://slsa.dev")
- *CISA — SolarWinds Advisory AA21-008A* : #link("https://www.cisa.gov/uscert/ncas/alerts/aa21-008a")
- *Snyk — peacenotwar / node-ipc* : #link("https://snyk.io/blog/peacenotwar-malicious-npm-node-ipc-package-vulnerability/")
- *The Register — event-stream incident* : #link("https://www.theregister.com/security/2018/11/26/check-your-repos-crypto-coin-stealing-code-sneaks-into-fairly-popular-npm-lib-2m-downloads-per-week/732879")

== Ressources complémentaires pour ce cours

- *Gene Kim* — « The Three Ways: The Principles Underpinning DevOps » (article, 2012) : #link("https://itrevolution.com/articles/the-three-ways-principles-underpinning-devops/")
- *John Willis* — « What DevOps Means to Me » (article fondateur du cadre CAMS, 2010) : #link("https://www.chef.io/blog/what-devops-means-to-me")
- *John Allspaw & Paul Hammond* — « 10+ Deploys per Day » (Velocity 2009, slides) : #link("https://www.slideshare.net/jallspaw/10-deploys-per-day-dev-and-ops-cooperation-at-flickr")

#bibliography("refs.bib", title: none, style: "ieee")
