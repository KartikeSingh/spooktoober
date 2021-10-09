local discordia = require('discordia')
local client = discordia.Client()
local prefix = '!'
local TOKEN = 'bot_token_here'

client:on('ready', function() 
    print('Ready')
    client:setGame('watching for !ghostlyFacts')
end)

client:on('messageCreate', function(message)
    if message.content == prefix ..'ping' then
        message.channel:send('🎃 pong! 🎃')
    end
end)

client:on('messageCreate', function(message)
    local content = message.content
    local member = message.member
    local id = member.id
    if content:lower() == prefix .. 'help' then
        message.channel:send('```help  shows this message\nfacts  shows halloween facts\nsource  the link for where the facts come from\ninvite  sends the bot invite```')
    end
end)

client:on('messageCreate', function(message)
    local content = message.content
    local member = message.member
    local id = member.id
    if content:lower() == prefix .. 'invite' then
        message.channel:send('https://discord.com/api/oauth2/authorize?client_id=896186210458927134&permissions=3072&scope=bot')
    end
end)

client:on('messageCreate', function(message)
    local content = message.content
    local member = message.member
    local id = member.id
    if content:lower() == prefix .. 'facts' then
        local facts = {
            'The first Jack O’Lanterns were actually made from turnips.',
            'Halloween is the second highest grossing commercial holiday after Christmas.',
            'The word “witch” comes from the Old English wicce, meaning “wise woman.” In fact, wiccan were highly respected people at one time. According to popular belief, witches held one of their two main meetings, or sabbats, on Halloween night.',
            'Samhainophobia is the fear of Halloween.',
            'Fifty percent of kids prefer to receive chocolate candy for Halloween, compared with 24% who prefer non-chocolate candy and 10% who preferred gum.',
            'The owl is a popular Halloween image. In Medieval Europe, owls were thought to be witches, and to hear an owl\'s call meant someone was about to die.',
            'According to Irish legend, Jack O’Lanterns are named after a stingy man named Jack who, because he tricked the devil several times, was forbidden entrance into both heaven and hell. He was condemned to wander the Earth, waving his lantern to lead people away from their paths.',
            'The Guinness World Record for Heaviest Pumpkin is held by Mathias Willemijns from Belgium and his 2,624.6-pound pumpkin.',
            'Stephen Clarke holds the record for the world’s fastest pumpkin carving time: 24.03 seconds, smashing his previous record of 54.72 seconds. The rules of the competition state that the pumpkin must weigh less than 24 pounds and be carved in a traditional way, which requires at least eyes, nose, ears, and a mouth.',
            'Trick-or-treating evolved from the ancient Celtic tradition of putting out treats and food to placate spirits who roamed the streets at Samhain, a sacred festival that marked the end of the Celtic calendar year.',
            '“Souling” is a medieval Christian precursor to modern-day trick-or-treating. On Hallowmas (November 1), the poor would go door-to-door offering prayers for the dead in exchange for soul cakes.',
            'The first known mention of trick-or-treating in print in North America occurred in 1927 in Blackie, Alberta, Canada.',
            'With their link to the ancient Celtic festival of Samhain (a precursor to Halloween) and later to witches, cats have a permanent place in Halloween folklore. During the ancient celebration of Samhain, Druids were said to throw cats into a fire, often in wicker cages, as part of divination proceedings.',
            '“Halloween” is short for “Hallows’ Eve” or “Hallows’ Evening,” which was the evening before All Hallows’ (sanctified or holy) Day or Hallowmas on November 1. In an effort to convert pagans, the Christian church decided that Hallowmas or All Saints’ Day (November 1) and All Souls’ Day (November 2) should assimilate sacred pagan holidays that fell on or around October 31.',
            'Black and orange are typically associated with Halloween. Orange is a symbol of strength and endurance and, along with brown and gold, stands for the harvest and autumn. Black is typically a symbol of death and darkness and acts as a reminder that Halloween once was a festival that marked the boundaries between life and death.',
            'Ireland is typically believed to be the birthplace of Halloween.',
            'Scarecrows, a popular Halloween fixture, symbolize the ancient agricultural roots of the holiday.',
            'Halloween has variously been called All Hallows’ Eve, Witches Night, Lamswool, Snap-Apple Night, Samhaim, and Summer’s End.',
            'Halloween was influenced by the ancient Roman festival Pomona, which celebrated the harvest goddess of the same name. Many Halloween customs and games that feature apples (such as bobbing for apples) and nuts date from this time. In fact, in the past, Halloween has been called San-Apple Night and Nutcrack Night.',
            'Because Protestant England did not believe in Catholic saints, the rituals traditionally associated with Hallowmas (or Halloween) became associated with Guy Fawkes Night. England declared November 5th Guy Fawkes Night to commemorate the capture and execution of Guy Fawkes, who co-conspired to blow up the Parliament in 1605 in order to restore a Catholic king.',
            'Harry Houdini (1874-1926) was one of the most famous and mysterious magicians who ever lived. Strangely enough, he died in 1926 on Halloween night as a result of appendicitis brought on by three stomach punches.',
            'Scottish girls believed they could see images of their future husband if they hung wet sheets in front of the fire on Halloween. Other girls believed they would see their boyfriend’s faces if they looked into mirrors while walking downstairs at midnight on Halloween.',
            'According to tradition, if a person wears his or her clothes inside out and then walks backwards on Halloween, he or she will see a witch at midnight.',
            'Mexico celebrates the Days of the Dead (Días de los Muertos) on the Christian holidays All Saints’ Day (November 1) and All Souls’ Day (November 2) instead of Halloween. The townspeople dress up like ghouls and parade down the street.',
            'During the pre-Halloween celebration of Samhain, bonfires were lit to ensure the sun would return after the long, hard winter. Often Druid priests would throw the bones of cattle into the flames and, hence, “bone fire” became “bonfire.”',
            'The famous magician Harry Houdini died on October 31, 1926.',
            'Dressing up as ghouls and other spooks originated from the ancient Celtic tradition of townspeople disguising themselves as demons and spirits. The Celts believed that disguising themselves this way would allow them to escape the notice of the real spirits wandering the streets during Samhain.',
            'The National Retail Federation expects consumers in 2010 to spend $66.28 per person—which would be a total of approximately $5.8 billion—on Halloween costumes, cards, and candy. That’s up from $56.31 in 2009 and brings spending back to 2008 levels.',
            'In 1970, a five-year-old boy Kevin Toston allegedly ate Halloween candy laced with heroin. Investigators later discovered the heroin belonged to the boy’s uncle and was not intended for a Halloween candy.',
            'In 1974, eight-year-old Timothy O’Bryan died of cyanide poisoning after eating Halloween candy. Investigators later learned that his father had taken out a $20,000 life insurance policy on each of his children and that he had poisoned his own son and also attempted to poison his daughter.',
            'According to the National Retail Federation, 40.1% of those surveyed plan to wear a Halloween costume in 2010. In 2009, it was 33.4%. Thirty-three percent will throw or attend a party.',
            'In 2010, 72.2% of those surveyed by the National Retail Federation will hand out candy, 46.3% will carve a pumpkin, 20.8% will visit a haunted house, and 11.5% will dress up their pets.',
            'Halloween is thought to have originated around 4000 B.C., which means Halloween has been around for over 6,000 years.',
            'The longest haunted house in the world is "Factory of Terror" in Canton, Ohio.',
            'Teng Chieh or the Lantern Festival is one Halloween festival in China. Lanterns shaped like dragons and other animals are hung around houses and streets to help guide the spirits back to their earthly homes. To honor their deceased loved ones, family members leave food and water by the portraits of their ancestors.',
            'A child born on Halloween is said to have the ability to talk to spirits.',
            'Halloween celebrations in Hong Kong are known as Yue Lan or the “Festival of the Hungry Ghosts” during which fires are lit and food and gifts are offered to placate potentially angry ghosts who might be looking for revenge.',
            'In many countries, such as France and Australia, Halloween is seen as an unwanted and overly commercial American influence.',
            'Children are more than twice as likely to be killed in a pedestrian/car accident on Halloween than on any other night.',
            'Both Salem, Massachusetts, and Anoka, Minnesota, are the self-proclaimed Halloween capitals of the world.',
            'Boston, Massachusetts, holds the record for the most Jack O’Lanterns lit at once (30,128).',
            'Pumpkins are classified as a fruit, not as a vegetable. In fact, in 2006, New Hampshire declared that its state fruit is the pumpkin.',
            'In a few American cities, Halloween was originally called "Cabbage Night." The name is on a Scottish fortune-telling game in which girls would use cabbage stumps to predict who their future husband would be.',
            'The original name of Count Dracula in Bram Stoker\'s famous book was Count Wampyr.',
            'Comedian John Evans once quipped: “What do you get if you divide the circumference of a jack-o’-lantern by its diameter? Pumpkin π.',
            'The Village Halloween parade in New York City is the largest Halloween parade in the United States. The parade includes 50,000 participants and draws over 2 million spectators.',
            'The blockbuster movie Halloween was filmed in just 21 days.',
            'The movie Halloween was originally titled Babysitter Murders.',
            'The sounds of stabbing in the Halloween movie is made by a knife being plunged into a watermelon.',
            'In an attempt to decrease robberies and crime on Halloween, Walnut Creek, California banned masks without a permit.',
            'In Bellville, Missouri, it is illegal to ask for candy if you are over the age of 13.',
            'In Dublin, Georgia, it is illegal for anyone over the age of 16 to wear a mask, sunglasses, or any other facial covering on Halloween.',
            'In Alabama, it is illegal to dress up as a priest or as a nun on Halloween.',
            'The average bag of candy that one child will collect on Halloween contains about 11,000 calories.',
            'The original creator of Milk Duds wanted to make the candies into perfect circles. When that proved impossible, he called them "duds." He added the word "milk" to refer to the large amount of milk used to make the candy.',
            'Because the movie Halloween (1978) was on such a tight budget, they had to use the cheapest mask they could find for the character Michael Meyers, which turned out to be a William Shatner Star Trek mask. Shatner initially didn’t know the mask was in his likeness, but when he found out years later, he said he was honored.'
        }
        message.channel:send(facts[math.random(1, #facts)])
    end
end)

client:on('messageCreate', function(message)
    local content = message.content
    local member = message.member
    local id = member.id
    if content:lower() == prefix  .. 'source' then
        message.channel:send('The facts come from:\nhttps://www.factretriever.com/halloween-facts')
    end
end)

client:run('Bot ' .. TOKEN)
