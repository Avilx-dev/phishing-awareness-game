# 🎮 Phishing Awareness Game

> Videojuego 3D de concienciación en ciberseguridad desarrollado en Godot 4.
> Proyecto universitario — ITSE Panamá · 2026

---

## 🕹️ Descripción

Juego de perspectiva en tercera persona ambientado en una oficina corporativa low-poly. El jugador asume uno de dos roles:

- **Modo Insider** — Eres el atacante infiltrado. Ejecuta ataques (USB drop, phishing, keylogger, ingeniería social) sin ser descubierto por los empleados NPC.
- **Modo Detective** — Investiga la oficina, interroga empleados y descubre quién es el Insider.

Inspirado en la dinámica social de *Among Us*, con un sistema de sospecha, conos de visión y entrevistas post-ataque.

---

## 👥 Equipo

| Integrante | Rol |
|---|---|
| Jesús Ávila (Avilx) | Lead Dev · Mecánicas · Git |
| Martin Lu | Narrative · Game Design |
| Juan Herrera | Escenario 3D · Assets |
| Daniel Córdoba | NPCs · UI · Partículas |

---

## 🛠️ Stack Técnico

- **Engine:** Godot 4
- **Lenguaje:** GDScript
- **Assets:** Kenney.nl · itch.io (low-poly, licencia libre)
- **Control de versiones:** Git + Git LFS
- **Gestión:** GitHub Projects

---

## 🌿 Ramas

| Rama | Responsable | Descripción |
|---|---|---|
| `main` | Avilx | Versión estable — solo merge revisado |
| `dev` | Todos | Integración diaria |
| `feat/mecanicas-insider` | Avilx | Lógica de ataques y sistema de sospecha |
| `feat/escenario-oficina` | Juan | Mapa 3D de la oficina |
| `feat/ui-npc` | Daniel | Interfaz, HUD y comportamiento de NPCs |

---

## 📁 Estructura del Proyecto

res://
├── scenes/
│ ├── world/ ← Escenario 3D (Juan)
│ ├── npcs/ ← Personajes NPC (Daniel)
│ ├── ui/ ← Interfaz de usuario (Daniel)
│ ├── mechanics/ ← Lógica de ataques (Avilx)
│ └── player/ ← Personaje jugable (Avilx)
├── scripts/
├── assets/
└── docs/


---

## 📅 Roadmap

| Semana | Hito |
|---|---|
| 1 | Setup repo · Escena base · Estructura Godot |
| 2 | Escenario jugable · NPCs caminando |
| 3 | Mecánicas Insider (USB, phishing) |
| 4 | Modo Detective · Sistema de entrevistas |
| 5 | IA NPC completa · Sistema de sospecha |
| 6 | UI completa · Audio · Polish |
| 7 | Bug fixing · Build final · Presentación |

---

## 📄 Licencia

Proyecto académico — ITSE Panamá · 2026
