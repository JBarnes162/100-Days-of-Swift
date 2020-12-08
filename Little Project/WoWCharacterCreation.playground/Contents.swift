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
    case Default
}

enum Faction {
    case Horde
    case Alliance
    case Default
}

enum HordeRace {
    case Orc
    case Undead
    case Tauren
    case Troll
    case BloodElf
    case Goblin
    case Default
}

enum AllianceRace {
    case Human
    case Dwarf
    case NightElf
    case Gnome
    case Draenai
    case Worgen
    case Default
}

class CreateCharacter {
    //variables:
    var characterName: String
    var characterFaction: Faction
    var characterHRace: HordeRace?
    var characterARace: AllianceRace?
    var characterClass: Classes
    
    //initialise
    init() {
        characterName = "Default Name"
        characterFaction = Faction.Default
        characterHRace = HordeRace.Default
        characterARace = AllianceRace.Default
        characterClass = Classes.Default
    }
    //method
    
    func readDescription(){
        if self.characterARace == AllianceRace.Default{
            print("You created: \(self.characterHRace!) \(self.characterClass) with the name of \(self.characterName)")
            print("For the horde!")
        } else {
            print("You created: \(self.characterARace!) \(self.characterClass) with the name of \(self.characterName)")
            print("For the alliance!")
        }
    }
}

var jackson = CreateCharacter.init()
jackson.characterClass = Classes.Monk
jackson.characterARace = AllianceRace.Human
jackson.characterFaction = Faction.Alliance
jackson.characterName = "Jeranbi"
jackson.readDescription()

var angelina = CreateCharacter.init()
angelina.characterName  = "Elpina"
angelina.characterFaction = Faction.Alliance
angelina.characterHRace = HordeRace.BloodElf
angelina.characterClass = Classes.Hunter
angelina.readDescription()
