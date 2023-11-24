const express = require('express');
const app = express();
const port = 3000;

// Middleware to parse JSON body in POST and PUT requests
app.use(express.json());

// GET request handler
app.get('/', (req, res) => {
    res.status(200).sendFile(__dirname + '/index.html', (err) => {
      if (err) {
        res.status(500).send('Error loading the HTML file');
      }
    });
  });
  

// POST request handler
app.post('/upload', upload.single('image'), (req, res) => {
    const imageFile = req.file; // Uploaded image file
    const username = req.body.username; // Text data
  
    if (!imageFile) {
      return res.status(400).send('Please upload an image');
    }
  
    if (!username) {
      return res.status(400).send('Username is required');
    }
  
    // Process the image and text data here
  
    // Example processing steps (replace with your logic)
    const imageURL = `/uploads/${imageFile.filename}`; // Assuming the image is saved in 'uploads' folder
    const message = `Image uploaded successfully for ${username}`;
    
    // Generate a response object
    const responseObj = {
      imageURL: imageURL,
      message: message,
      additionalInfo: {
        uploadedBy: username,
        timestamp: Date.now()
      }
    };
  
    // Send the response
    res.status(200).json(responseObj);
  });


// PUT request handler
app.post('/upload', upload.single('image'), (req, res) => {
  const imageFile = req.file; // Uploaded image file
  const username = req.body.username; // Text data

  if (!imageFile) {
    return res.status(400).send('Please upload an image');
  }

  if (!username) {
    return res.status(400).send('Username is required');
  }

  // Process the image and text data here

  // Example processing steps (replace with your logic)
  const imageURL = `/uploads/${imageFile.filename}`; // Assuming the image is saved in 'uploads' folder
  const message = `Image uploaded successfully for ${username}`;
  
  // Generate a response object
  const responseObj = {
    imageURL: imageURL,
    message: message,
    additionalInfo: {
      uploadedBy: username,
      timestamp: Date.now()
    }
  };

  // Send the response
  res.status(200).json(responseObj);
});




// Start the server
app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});
