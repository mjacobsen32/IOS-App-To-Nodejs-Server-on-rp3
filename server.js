const express = require('express')
const app = express()
app.use(express.json());
app.use(express.urlencoded({ extended: true}));

app.get("/ls", function(req,res){
	console.log("running cmd: ls")
	const { exec } = require('child_process');
	exec('ls', (err,stdout,stderr) => {
		if (err) {
			console.error(err)
		} else {
			console.log(`stdout: ${stdout}`);
			res.send(`${stdout}`);
		}
	});
})

app.get("/cat/:file", function(req,res){
	console.log("running cmd: cat")
	const file = req.params.file
	const { exec } = require('child_process');
	exec(`cat ${file}`, (err,stdout,stderr) => {
		if(err){
			console.log(err)
		} else {
			console.log(`stdout: ${stdout}\n`);
			res.send(`${stdout} `);
		}
	});
})

app.post('/vim/:name', (req,res) => {
	console.log("running cmd: vim")
	const name = req.params.name
	console.log("file_name = " + name)
	const { exec } = require('child_process');
	exec(`touch ${name}` ,(err,stdout,stderr) => {
		if (err){
			console.log(err)
		} else {
			console.log(`stdout: ${stdout}\n`);
		}
	});
})

app.post('/append', (req,res) => {
	console.log("running cmd: >> ")
	var data = req.body
	const { exec } = require('child_process');
	exec(`echo "${data.str}" >> ${data.file}`, (err,stdout,stderr) => {
		if (err){
			console.log(err)
		} else {
			console.log(`stdout: ${stdout}\n`);
		}
	});
})

var server = app.listen(8081, "10.34.65.49", function(){
	console.log("Server is running!")
})
