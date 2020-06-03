# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "json"
file = File.open "mroster_db.json"
data = JSON.load file

# database
databases = Database.create!([{name: data["database"]["name"]}])

# warbands
for warband in data["database"]["warbands"]
    Warband.create!(warband_type: warband, database: databases.first)
end

# races
for race in data["database"]["races"]
    Race.create!(name: race["name"], max_m: race["max_m"], max_ws: race["max_ws"], max_bs: race["max_bs"], max_s: race["max_s"], max_t: race["max_t"], max_w: race["max_w"], max_i: race["max_i"], max_a: race["max_a"], max_ld: race["max_ld"], database: databases.first)
end

# skills
skills = {}
for skill in data["database"]["skills"]
    skills[skill["name"]] = Skill.create!(name: skill["name"], usable: skill["usable"], cost: skill["cost"], uses_per_game: skill["uses_per_game"], description: skill["description"], reminder: skill["reminder"], database: databases.first)
end

# skill list
skill_lists = {}
for skill_list in data["database"]["skill_lists"]
    skill_lists[skill_list["name"]] = SkillList.create!(name: skill_list["name"], database: databases.first, skill_list_type: skill_list["skill_list_type"], warband: Warband.find_by(warband_type: skill_list["name"]))
    for skill in skill_list["skills"]
        SkillSkillList.create!(skill: skills[skill], skill_list: skill_lists[skill_list["name"]], database: databases.first)
    end
end

equipments = {}
for e in data["database"]["equipment"]
    equipments[e["name"]] = Equipment.create!(name: e["name"], usable: e["usable"], charges: e["charges"], cost: e["cost"], uses_per_game: e["uses_per_game"], description: e["description"], reminder: e["reminder"], special_cost: e["special_cost"], database: databases.first)
end

for unit in data["database"]["units"]
    u = Unit.create!(name: unit["name"], unit_type: unit["unit_type"], suggestion: unit["suggestion"], m: unit["m"], ws: unit["ws"], bs: unit["bs"], s: unit["s"], t: unit["t"], w: unit["w"], i: unit["i"], a: unit["a"], ld: unit["ld"], exp: unit["exp"], cost: unit["cost"], race: Race.find_by(name: unit["race"]), warband: Warband.find_by(warband_type: unit["warband"]), rating: unit["rating"], database: databases.first, warrior_type: unit["warrior_type"])

    for skill in unit["special_skills"]
        SpecialSkillsConn.create!(unit: u, skill: skills[skill], database: databases.first)
    end

    for special_rule in unit["special_rules"]
        SpecialRulesConn.create!(unit: u, skill: skills[special_rule], database: databases.first)
    end

    for skill_list in unit["skill_lists"]
        if skill_lists[skill_list] == "magic"
            MagicListsConn.create!(unit: u, skill_list: skill_lists[skill_list], database: databases.first)
        else
            UnitSkillList.create!(unit: u, skill_list: skill_lists[skill_list], database: databases.first)
        end
    end

    for e in unit["starting_equipment"]
        StartingEquipmentConn.create!(unit: u, equipment: equipments[e], database: databases.first)
    end
end


