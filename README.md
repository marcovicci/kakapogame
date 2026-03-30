# kakapo game

## LINKS
* Recommended Godot version: 4.4.1 Stable [(Download link here)](https://godotengine.org/download/archive/4.4.1-stable/)
* [Miro board](https://miro.com/app/board/uXjVI4bZ88M=/)
* [Trello board](https://trello.com/b/KQIxtFbk/kakapo-island-game)

## How to install 
### Downloading the project
- Click the green "Code" button above the list of files on this page, and download the project as a .zip. You do not need to unzip it to import it into Godot.
### Getting Godot
- Visit the link above to download the "standard" Godot 4.4.1 Stable version for your operating system.
- Run the app / .exe this provides. You will end up in the Project Manager window.
![Screenshot of the Project Manager window](/repo/Project_Manager.png?raw=true)
- Select the "Import" icon with the image of a folder, and point it towards your downloaded project .zip. You will now be able to double-click it in your project list.
### Anatomy of the project 
![Screenshot of the Godot project](/repo/Godot_Project.png?raw=true)
- The "Scene" window in the top left lists all of the objects in the game scene. 
- Clicking these will allow you to view their properties on the right-hand side of the screen, in the Inspector.
- The buttons at the top center of the screen will allow you to switch between viewing a 2D view of the game or viewing various scripts.
- The "FileSystem" window in the bottom left lists files such as images, scripts and scenes. 
### What are scenes? 
- Scenes can be a lot of different things. Some, like test_scene.tscn or old_kakapo_scene.tscn are like their own mini-projects full of different objects and scripts. These are held in the "Root Scenes" folder in this project.
- Scenes can also be used like what Unity used to call "prefabs" -- essentially, a saved version of an object that can be duplicated indefinitely, and edits made to the core "scene" will carry over to the duplicates. For example, moose.tscn represents the player character and its scripts. These are held in the "Prefab" folder in this project.
- In the "Scene" window, any object that is also a scene will have a little clapperboard icon beside it. You can edit the core scene by clicking on that icon.

## TODO LIST (AS OF 2026)
### Repository, project stuff
- [x] Github repo built
- [x] Install/run instructions and Godot breakdown in readme
- [ ] Comment code sensibly for Tanya
    - [x] Arrow button
    - [x] Camera target
    - [x] Camera tweening
### Game code, scene switching
- [x] Camera_Target and Movement_Button objects which can move the camera around
- [ ] Moving the moose to a new scene along with the camera
### Game code, puzzles
- [ ] Basic clickable-object framework to trigger animations 
### Game code, UI
- [ ] Map screen
- [ ] Fast travel? 
- [ ] Journal
### Game code, "cutscenes"
- [ ] Opening scene?
- [ ] Sailing scene?
- [ ] Kakapo booming scene?
### Graphics
- [x] Blur shader material added to produce depth of field effects 
- [ ] Example scene with blur shader material
- [ ] Sprites implemented
- [ ] Sprite animations implemented

## Most recent build changes
### March/April 2026
- Building a new scene, returning to point-and-click roots :) 
- New Camera_Target object; can be linked to a "Movement Button" object which tweens the camera to the target's location 
- Recreated todo list
- Better organization of project assets
