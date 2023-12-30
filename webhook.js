const express = require('express');
const { exec } = require('child_process');

const app = express();
const port = 3000; // Choose a port to listen on

app.use(express.json());

app.post('/', (req, res) => {
    const payload = req.body;
    // Run `docker-compose up --build` to rebuild and restart the "me.site" service
    console.log('Received payload. Attempting updating the site')
    exec('git pull origin main', (pullError, pullStdout, pullStderr) => {
        if (pullError) {
            console.error(`Error pulling changes: ${pullError}`);
            return;
        }
    })
    console.log('Repo updated.')
    res.sendStatus(200);
});

app.listen(port, () => {
    console.log(`Webhook listener listening at http://localhost:${port}`);
});