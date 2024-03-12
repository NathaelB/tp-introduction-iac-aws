const AWS = require('aws-sdk');
const sns = new AWS.SNS({ apiVersion: '2010-03-31' });

exports.handler = async (event) => {
    const params = {
        Message: process.env.NOTIFICATION_MESSAGE, // Message que vous souhaitez envoyer
        Subject: 'Notification de déploiement EC2', // Sujet du message
        TopicArn: process.env.SNS_TOPIC_ARN // Remplacez par votre ARN de sujet SNS
    };

    try {
        const data = await sns.publish(params).promise();
        console.log(`Message ${params.Message} envoyé au sujet ${params.TopicArn}`);
        console.log("Data:", data);
        return { status: 'Succès', message: 'Message envoyé', messageId: data.MessageId };
    } catch (err) {
        console.error("Erreur lors de l'envoi du message :", err.stack);
        return { status: 'Erreur', message: err.message };
    }
};