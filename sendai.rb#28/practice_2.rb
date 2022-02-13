class FireMan

  def initialize
    @health = 120
    @power = 50
    @speed = 20
  end

  def hell_fire
    @power += 30
    puts "#{self.class.name}: Fall down!"
  end
end

class WoodBoy

  def initialize
    @health = 150
    @power = 40
    @speed = 10
  end

  def leaf_heal
    puts "#{self.class.name}: I'll never down!"
    @health += 50
  end
end

class WaterLady

  def initialize
    @health = 80
    @power = 30
    @speed = 50
  end

  def water_skate
    @speed += 30
    puts "#{self.class.name}: Can you keep up with me?"
  end
end

class DrMaterial

  def initialize
    @health = 110
    @power = 30
    @speed = 30
  end

  def dark_matter
    puts "#{self.class.name}: HAHAHAHAHAHA!!"
    @health -= 50
    @power += 50
    @speed += 50
  end
end

class GrandMaster
  def call_hero(hero_type: nil)
    case hero_type&.to_sym
    when :fire
      hero = FireMan.new
    when :wood
      hero = WoodBoy.new
    when :water
      hero = WaterLady.new
    when :other
      hero = DrMaterial.new
    else
      hero = [FireMan, WoodBoy, WaterLady, DrMaterial].sample.new
    end
  end
end

# main
grand_master = GrandMaster.new
hero = grand_master.call_hero(hero_type: :fire)
case hero
when FireMan
  hero.hell_fire
when WoodBoy
  hero.leaf_heal
when WaterLady
  hero.water_skate
when DrMaterial
  hero.dark_matter
end

another_hero = grand_master.call_hero
case another_hero
when FireMan
  another_hero.hell_fire
when WoodBoy
  another_hero.leaf_heal
when WaterLady
  another_hero.water_skate
when DrMaterial
  another_hero.dark_matter
end
