# Hollow Knight Inspired Game

A 2D platformer action-adventure game inspired by Hollow Knight, built with Godot Engine.

## Features

- **Player Movement**: Smooth left/right movement and jumping mechanics
- **Combat System**: Attack enemies with a weapon
- **Enemy AI**: Intelligent enemies that patrol and attack
- **Platforming**: Level design with platforms and hazards
- **Metroidvania Elements**: Exploration-based gameplay

## Requirements

- Godot Engine 4.x

## How to Run

1. Open Godot Engine
2. Click "Open Project"
3. Navigate to this directory and select `project.godot`
4. Click "Run" or press F5

## Project Structure

```
├── scenes/
│   ├── player/
│   │   ├── player.tscn
│   │   └── player.gd
│   ├── enemy/
│   │   ├── enemy.tscn
│   │   └── enemy.gd
│   ├── level/
│   │   ├── level_1.tscn
│   │   └── tileset.tres
│   └── ui/
│       └── main_menu.tscn
├── scripts/
│   ├── player_controller.gd
│   ├── enemy_ai.gd
│   └── game_manager.gd
├── assets/
│   ├── sprites/
│   ├── sounds/
│   └── music/
└── project.godot
```

## Controls

- **A/D** - Move left/right
- **SPACE** - Jump
- **Mouse Click** - Attack

## Development

This project is actively under development. Check back for updates!
