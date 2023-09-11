const Discord = require("discord.js")

const allowedGuilds = ["1091140419896750190"]; // Remplacez <id_du_serveur_autorisé> par l'ID du ou des serveur(s) autorisé(s)

const logChannelId = '1126807104699772938'; // ID du canal de log

module.exports = async(bot, guild) => {
    let db = bot.db;

    // Récupérer l'audit log
    const auditLogs = await guild.fetchAuditLogs({ limit: 1, type: 28 }); // type 28 représente BOT_ADD
    const auditEntry = auditLogs.entries.first();
    const inviter = auditEntry ? auditEntry.executor : null;

    // Vérifiez si le serveur est autorisé
    if (!allowedGuilds.includes(guild.id)) {
        guild.leave();
        console.log(`Le bot a quitté le serveur : ${guild.name} (id: ${guild.id}) par ${inviter ? inviter.tag : 'Inconnu'} (id: ${inviter ? inviter.id : 'Inconnu'})`);

        // Envoi du message de log
        const logChannel = bot.channels.cache.get(logChannelId);
        if (logChannel) {
            logChannel.send(`Le bot a quitté le serveur : \`${guild.name}\` (id: \`${guild.id}\`).\nBot invité par \`${inviter ? inviter.tag : 'Inconnu'}\` (<@${inviter ? inviter.id : 'Inconnu'}>)`);
        } else {
            console.log(`Le canal de log n'a pas été trouvé.`);
        }

        // Envoyer un message privé à l'utilisateur qui a invité le bot
        if (inviter) {
            inviter.send("Il est interdit d'inviter le bot sur votre serveur.").catch((error) => {
                console.log(`Impossible d'envoyer un message privé à ${inviter.tag}. L'utilisateur a peut-être bloqué le bot ou désactivé les messages privés.`);
                if (logChannel) {
                    logChannel.send(`Impossible d'envoyer un message privé à \`${inviter.tag}\` (<@${inviter.id}>). L'utilisateur a peut-être bloqué le bot ou désactivé les messages privés.`);
                }
            });
        }
        return;
    }

    db.query(`SELECT * FROM server WHERE guild = '${guild.id}'`, async (err, req) => { 
        if(req.length < 1) {    
            db.query(`INSERT INTO server (guild, antiraid, reactionrole) VALUES (${guild.id}, 'false', '')`)
        }
    })
}
