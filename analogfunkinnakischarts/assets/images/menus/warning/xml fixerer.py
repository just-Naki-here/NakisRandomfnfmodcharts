import sys

def coolutilbutpython(_:str, zeros:int):
    while(len(_) < zeros):
        _ = "0" + _
    return _

idk:list = [
    "x=\"1\" y=\"1\" width=\"1280\" height=\"720\" frameX=\"0\" frameY=\"0\" frameWidth=\"1280\" frameHeight=\"720\"/>",
	"x=\"1\" y=\"724\" width=\"1280\" height=\"720\" frameX=\"0\" frameY=\"0\" frameWidth=\"1280\" frameHeight=\"720\"/>",
	"x=\"1\" y=\"1447\" width=\"1280\" height=\"720\" frameX=\"0\" frameY=\"0\" frameWidth=\"1280\" frameHeight=\"720\"/>",
	"x=\"1\" y=\"2170\" width=\"1280\" height=\"720\" frameX=\"0\" frameY=\"0\" frameWidth=\"1280\" frameHeight=\"720\"/>",
	"x=\"1\" y=\"2893\" width=\"1280\" height=\"720\" frameX=\"0\" frameY=\"0\" frameWidth=\"1280\" frameHeight=\"720\"/>",
	"x=\"1\" y=\"3616\" width=\"1280\" height=\"720\" frameX=\"0\" frameY=\"0\" frameWidth=\"1280\" frameHeight=\"720\"/>",
	"x=\"1\" y=\"4339\" width=\"1280\" height=\"720\" frameX=\"0\" frameY=\"0\" frameWidth=\"1280\" frameHeight=\"720\"/>",
	"x=\"1\" y=\"5062\" width=\"1280\" height=\"720\" frameX=\"0\" frameY=\"0\" frameWidth=\"1280\" frameHeight=\"720\"/>",
	"x=\"1\" y=\"5785\" width=\"1280\" height=\"720\" frameX=\"0\" frameY=\"0\" frameWidth=\"1280\" frameHeight=\"720\"/>",
	"x=\"1\" y=\"6508\" width=\"1280\" height=\"720\" frameX=\"0\" frameY=\"0\" frameWidth=\"1280\" frameHeight=\"720\"/>"
]

fileContent:str = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<TextureAtlas imagePath=\"texture.png\" width=\"1282\" height=\"7229\" spritePadding=\"3\" borderPadding=\"1\">"
mynewxml = open(sys.path[0] + "\\bg.xml", "w")
counterr:int = 0
secondthing:int = 0

while counterr != len(idk):
    if secondthing % 20 == 0:
        counterr += 1
    fileContent = fileContent + "\n   <SubTexture name=\"bg" + (coolutilbutpython(str(secondthing), 4)) + "\" " + idk[counterr -1]
    secondthing += 1

mynewxml.write(fileContent + "\n</TextureAtlas>")