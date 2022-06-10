class FireMan

  def initialize
    @health = 120
    @power = 50
    @speed = 20
  end

  def use_special_skill
    hell_fire
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

  def use_special_skill
    leaf_heal
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

  def use_special_skill
    water_skate
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

  def use_special_skill
    dark_matter
  end

  def dark_matter
    puts "#{self.class.name}: HAHAHAHAHAHA!!"
    @health -= 50
    @power += 50
    @speed += 50
  end
end

class GrandMaster
  def initialize(hero_book)
    register_heroes(hero_book)
  end

  def register_heroes(hero_book)
    @hero_book = (hero_book)
  end

  def call_hero(hero_type: nil)
    @hero_book.fetch(hero_type, emergency_call_hero)
  end

  def emergency_call_hero
    registered_hero_types = @hero_book.keys
    @hero_book[registered_hero_types.sample]
  end
end

def create_hero_book
  {
    fire: FireMan,
    wood: WoodBoy,
    water: WaterLady,
    other: DrMaterial
  }.freeze
end

hero_book = create_hero_book
grand_master = GrandMaster.new(hero_book)
hero = grand_master.call_hero(hero_type: :fire).new
hero.use_special_skill

another_hero =  grand_master.call_hero.new
another_hero.use_special_skill
