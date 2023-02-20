# Add seed data in this file
puts "Seeding Data, Plsease wait..."
spells = ["acid-arrow", "animal-messenger", "calm-emotions", "charm-person"]

spells.each do |index|
    response = RestClient.get "https://www.dnd5eapi.co/api/spells/#{index}"

    spell_hash = JSON.parse(response)

    Spell.create(
        name: spell_hash["name"],
        level: spell_hash["level"],
        description: spell_hash["desc"][0]
    )
end

puts "Done!"