const fs = require('fs');
const path = require('path');
const AdmZip = require('adm-zip');

// === CONFIGURATION ===
const files = [
	'src/decks.lua',
	'src/main.lua',
];

const header = `--- STEAMODDED HEADER
--- MOD_NAME: Shukaaa's Balanced Deck Collection
--- MOD_ID: ShukaaasDeckCollection
--- MOD_AUTHOR: [Shukaaa]
--- MOD_DESCRIPTION: A collection of 100% self coded Decks || Credits: <Absolute Deck> inspired by Steamo
----------------------------------------------
------------MOD CODE -------------------------
`;

const footer = `
----------------------------------------------
------------MOD CODE END----------------------
`;

const outputFileName = 'ShukaaasBalancedDeckCollection.lua';
const outputFolder = 'dist';
const buildFolder = path.join(outputFolder, outputFileName.replace(/\.lua$/, ''));
const outputZip = path.join(outputFolder, outputFileName.replace(/\.lua$/, '.zip'));
const assetsFolder = 'assets'; // optional folder to copy into zip

// === MERGE PROCESS ===
const start = Date.now();

try {
	// Prepare folders
	fs.mkdirSync(buildFolder, { recursive: true });

	// Merge Lua files
	let mergedContent = header;

	for (const filePath of files) {
		const content = fs.readFileSync(path.resolve(filePath), 'utf8');
		mergedContent += `\n${content}\n`;
	}

	mergedContent += footer;

	// Write merged file to build folder
	const mergedOutputPath = path.join(buildFolder, outputFileName);
	fs.writeFileSync(mergedOutputPath, mergedContent, 'utf8');

	// Copy assets if they exist
	if (fs.existsSync(assetsFolder)) {
		fs.cpSync(assetsFolder, path.join(buildFolder, assetsFolder), {
			recursive: true,
		});
	}

	// Create ZIP
	const zip = new AdmZip();
	zip.addLocalFolder(buildFolder);
	zip.writeZip(outputZip);

	const duration = Date.now() - start;
	console.log(`✅ Build complete. Files merged & zipped to '${outputZip}' in ${duration}ms`);
} catch (err) {
	console.error('❌ Build failed:', err.message);
}
