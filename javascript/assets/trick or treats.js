const discord = require("discord.js");
const { connection } = require("mongoose");
const path = require("path")
module.exports = {
    name: "trick or treats",
    run: async(client, message) => {
        let random = ["trick", "treats"]
        const choice = random[Math.floor(Math.random() * random.length)];
        const { voice }  = message.member
        if(!voice.channelID) {
            message.reply("You must in the voice channel!")
            return
        }
        if(choice === "trick") {
            voice.channel.join().then((connection) => {
                connection.play(path.join(__dirname, 'ghost.mp3'))
            })
            message.channel.send("Ouuuuuu! You get trick")
        }
        if(choice === "treats") {
            message.channel.send("Yeeeeeee! You get treats")
        }



   }
}