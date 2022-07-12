const functions = require("firebase-functions");
const admin = require('firebase-admin');
admin.initializeApp();
// functions.config().firebase
// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
// exports.helloWorld = functions.https.onRequest((request, response) => {
//   functions.logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });

exports.trigerSMvalue = functions.database.ref('FirebaseIOT/SM_Value').onUpdate((smValue, context) => {
    
    const updated = smValue.after.val();
    
    const payload = {
        notification:{
            title : 'Emergency- Soil Moisture is below 30%',
            body : 'Soil Moisture is '+ updated +'%',
            badge : '1',
            sound : 'default'
        }
    };

    return admin.database().ref('fcm-token').once('value').then(allToken => {

        if(allToken.val() && updated <= 30){
            const token = Object.keys(allToken.val());
            console.log(token)
            return admin.messaging().sendToDevice(token,payload);
        }else{
            console.log('No token available');
        }
    });
});