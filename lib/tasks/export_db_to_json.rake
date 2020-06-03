require 'json'
task :export_db_to_json => :environment do
    database = Database.where(name: "MRoster Default").first
    warbands = Warband.all.pluck(:warband_type)
    sls = SkillList.where(database: database.id)
    rs = Race.where(database: database.id)
    us = Unit.where(database: database.id)
    ss = Skill.where(database: database.id)
    es = Equipment.where(database: database.id)

    j = {
        database: {
            name: database.name,
            warbands: warbands,
        }
    }
     
    races = []
    for r in rs
        race = {name: r.name, max_m: r.max_m, max_ws: r.max_ws, max_bs: r.max_bs, max_s: r.max_s, max_t: r.max_t, max_w: r.max_w, max_i: r.max_i, max_a: r.max_a, max_ld: r.max_ld}
        races.push race
    end
    j[:database][:races] = races


    skills = []
    for s in ss
        skill = {name: s.name, usable: s.usable, cost: s.cost, uses_per_game: s.uses_per_game, description: s.description, reminder: s.reminder}
        skills.push skill
    end
    j[:database][:skills] = skills


    skill_lists = []
    for sl in sls
        skill_list = {name: sl.name, skill_list_type: sl.skill_list_type}
        skills = []
        for s in sl.skills
            skills.push s.name
        end
        skill_list[:skills] = skills
        skill_lists.push(skill_list)
    end
    j[:database][:skill_lists] = skill_lists

    equipments = []
    for e in es
        equipment = {name: e.name, usable: e.usable, charges: e.charges, cost: e.cost, uses_per_game: e.uses_per_game, description: e.description, reminder: e.reminder, special_cost: e.special_cost}
        equipments.push equipment
    end
    j[:database][:equipment] = equipments

    units = []
    for u in us
        unit = {name: u.name.nil? ? "" : u.name, unit_type: u.unit_type, suggestion: u.suggestion, m: u.m, ws: u.ws, bs: u.bs, s: u.s, t: u.t, w: u.w, i: u.i, a: u.a, ld: u.ld, exp: u.exp, cost: u.cost, race: u.race.name, warband: u.warband.warband_type, rating: u.rating, warrior_type: u.warrior_type, rout_test_contribution: u.rout_test_contribution.nil? ? 1 : u.rout_test_contribution}
        
        special_rules = []
        for s in u.special_rules
            special_rules.push s.name
        end
        unit[:special_rules] = special_rules
        
        skill_lists = []
        for sl in u.skill_lists
            skill_lists.push sl.name
        end
        unit[:skill_lists] = skill_lists

        equipment = []
        for e in u.starting_equipment
            equipment.push e.name
        end
        unit[:starting_equipment] = equipment

        special_skills = []
        for s in u.special_skills
            special_skills.push s.name
        end
        unit[:special_skills] = special_skills

        units.push unit
    end
    j[:database][:units] = units


    puts JSON.pretty_generate j
end