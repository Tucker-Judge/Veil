const express = require('express');
const app = express();
const port = 3000;

// take in input



// send input to api endpoint


// put back
app.use(express.json());


app.post('/api/response', (req, res) => {
  const { transcript } = req.body;
  // Replace this with your chatbot code
  const response = `I heard you say "${transcript}".`;

  res.json({ response });
});

app.listen(port, () => {
  console.log(`Listening at http://localhost:${port}`);
});