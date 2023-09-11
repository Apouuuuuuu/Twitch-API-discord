const axios = require('axios')
const discord = require('discord.js')
const fs = require('fs')

module.exports = async function() {

    let config_json = fs.readFileSync("config.json")
    let config_data = JSON.parse(config_json)
    let stream_id = null
    
    async function checkLiveStatus(twitchUsername)
    {
        try
        {
            let response = await axios.post('https://id.twitch.tv/oauth2/token', {
            client_id: config_data.client_id,
            client_secret: config_data.client_secret,
            grant_type: 'client_credentials'
            })
            let data = response.data
            let access_token = data.access_token
            const twitchAPIEndpoint = `https://api.twitch.tv/helix/streams?user_login=${twitchUsername}`;
            response = await axios.get(twitchAPIEndpoint, {
                headers: {
                    'Client-Id': config_data.client_id,
                    'Authorization': `Bearer ${access_token}`
                }
            })
            data = response.data.data                
            if (data.length > 0) 
            {
                stream_id = data[0].id
                return true; // User is live
            }
            return false; // User is not live
        }
        catch(err)
        {
            console.log(err)
        }
    }
    
    let webhook_url = config_data.webhook_url
    let streamers_data = config_data.streamers

    if(webhook_url == "")
    {
        console.log("Url du webhook non précisé, veuillez vérifier le fichier config.json")
        return
    }

    if(streamers_data == [])
    {
        console.log("Erreur, la tableau des streamers est vide !")
        return
    }

    for (let i = 0; i < streamers_data.length; i++) 
    {
        try 
        {
            const streamer = streamers_data[i];
            let f_is_streamer_live = await checkLiveStatus(streamer.name)
            if(f_is_streamer_live)
            {
                if(config_data.streams_already_notify.find(element => element == stream_id) != undefined)
                {
                    console.log(`Le stream ${stream_id} de ${streamer.name} a déjà été notifié`)
                    continue
                }

                config_data.streams_already_notify.push(stream_id)
                config_json = JSON.stringify(config_data)
                fs.writeFileSync("config.json", config_json)
                const webhookClient = new discord.WebhookClient({ url: webhook_url });
                const embed = new discord.EmbedBuilder()            
                .setTitle("Live Notification")
                .setImage("https://cdn.discordapp.com/attachments/1101336885827223622/1137092145250054305/telechargement_1.png")
                .setDescription(`🛰 \`${streamer.name}\`  à commencé son live !\n${streamer.link}`);

                await webhookClient.send({
                    content: `<@&${streamer.role_id}>`,
                    username: 'SOLARIS',                
                    embeds: [embed],
                });                
            }
        }
        catch (err)
        {
            console.log(err)
        }        
    }
}