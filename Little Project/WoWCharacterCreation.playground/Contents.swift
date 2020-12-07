enum Classes: Int {
    case Warrior
    case Hunter
    case Mage
    case Rogue
    case Priest
    case Warlock
    case Paladin
    case Druid
    case Shaman
    case Monk
    case DemonHunter
    case DeathKnight
}

enum Faction {
    case Horde
    case Alliance
}

enum HordeRace {
    case Orc
    case Undead
    case Tauren
    case Troll
    case BloodElf
    case Goblin
}

enum AllianceRace {
    case Human
    case Dwarf
    case NightElf
    case Gnome
    case Draenai
    case Worgen
}

struct CharacterHCreation {
    var characterName: String
    var characterFaction: Faction
    var characterHRace: HordeRace
    var characterClass: Classes
    
    func readDescription(){
        print("You created: \(characterHRace) \(characterClass) with the name of \(characterName)")
        print("For the HORDE!")
    }
}

struct CharacterACreation {
    var characterName: String
    var characterFaction: Faction
    var characterHRace: HordeRace
    var characterClass: Classes
    
    func readDescription(){
        print("You created: \(characterHRace) \(characterClass) with the name of \(characterName)")
        print("For the ALLIANCE!")
    }
}

var jackson = CharacterHCreation(characterName: "Jeranbi", characterFaction: Faction.Horde, characterHRace: HordeRace.Troll, characterClass: Classes.Paladin)

jackson.readDescription()

