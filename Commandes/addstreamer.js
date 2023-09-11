const Discord = require("discord.js")
const fs = require("fs")

module.exports = {

    name: "addstreamer",
    description: "Permet d'ajouter un streamer",
    permission: Discord.PermissionFlagsBits.ModerateMembers,
    dm: false,
    category: "Twitch",
    options: [
        {
            type: "string",
            name: "streamer_link",
            description: "Lien de la chaine du streamer",
            required: true,
            autocomplete: false
        }, {
            type: "string",
            name: "role_id",
            description: "ID du rôle lié au streamer",
            required: true,
            autocomplete: false
        }
    ],
    
    async run(bot, message, args) {

        try {
            let streamer_link = args.getString("streamer_link")
            let role_id = args.getString("role_id")
            const role = message.guild.roles.cache.get(role_id)
            let twitchRegex = /^(https?:\/\/)?(www\.)?twitch\.tv\/([a-zA-Z0-9_]+)$/;

            if(!role)
            {
                await message.reply(`Le rôle avec l'id ${role_id} n'existe pas, veuillez vérifier cela.`)
                return
            }
            
            if(!twitchRegex.test(streamer_link))
            {
                await message.reply(`Le lien de chaîne twitch donné n'est pas valide`)
                return
            }
            
            twitchRegex = /twitch\.tv\/(.+)/;
            const match = streamer_link.match(twitchRegex);
            let streamer_name = match ? match[1] : null
            let config_json = fs.readFileSync("config.json")
            let data = JSON.parse(config_json)
            let streamers_data = data.streamers
            let f_streamer_is_here = false
            
            for (let i = 0; i < streamers_data.length; i++) 
            {
                let streamer = streamers_data[i];
                if(streamer.name == streamer_name && streamer.role_id == role_id)
                {
                    f_streamer_is_here = true
                }
            }

            if(!f_streamer_is_here)
            {
                streamers_data.push({"name": streamer_name, "role_id": role_id, "link": streamer_link})
                data.streamers = streamers_data
                config_json = JSON.stringify(data)
                fs.writeFileSync("config.json", config_json)
                await message.reply(`Le streamer: ${streamer_name} avec l'id de rôle ${role_id} a bien été ajouté`)
            }
            
            else
            {
                await message.reply(`Le streamer: ${streamer_name} avec l'id de rôle ${role_id} a déjà été enregistré`)
            }
            
        } catch (err) {

            console.log(err)
            return message.reply("Ha erreur")
        }
    }
}