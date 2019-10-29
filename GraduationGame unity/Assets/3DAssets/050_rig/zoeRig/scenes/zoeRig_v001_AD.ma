//Maya ASCII 2019 scene
//Name: zoeRig_v001_AD.ma
//Last modified: Tue, Oct 29, 2019 04:36:48 PM
//Codeset: 1252
file -rdi 1 -ns ":" -rfn "zoeRN" -op "v=0;" -typ "mayaAscii" "C:/Users/Dadiu student/Documents/Graduation-Game/GraduationGame unity/Assets/3DAssets/040_model/020_character/zoe/live/zoe.ma";
file -r -ns ":" -dr 1 -rfn "zoeRN" -op "v=0;" -typ "mayaAscii" "C:/Users/Dadiu student/Documents/Graduation-Game/GraduationGame unity/Assets/3DAssets/040_model/020_character/zoe/live/zoe.ma";
requires maya "2019";
requires "mtoa" "3.1.2";
requires "stereoCamera" "10.0";
currentUnit -l centimeter -a degree -t film;
fileInfo "application" "maya";
fileInfo "product" "Maya 2019";
fileInfo "version" "2019";
fileInfo "cutIdentifier" "201812112215-434d8d9c04";
fileInfo "osv" "Microsoft Windows 10 Technical Preview  (Build 17134)\n";
fileInfo "license" "student";
createNode transform -s -n "persp";
	rename -uid "7F95E272-4A7C-4EEF-6877-EB81E6DF4B71";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 141.05572158963699 124.32211631307791 203.2709116606411 ;
	setAttr ".r" -type "double3" -372.93835272874577 392.9999999997637 -4.7404708162805874e-16 ;
createNode camera -s -n "perspShape" -p "persp";
	rename -uid "B1E2D02A-447D-A2BE-6030-408FC3D30EE8";
	setAttr -k off ".v" no;
	setAttr ".fl" 34.999999999999993;
	setAttr ".coi" 264.98139635638029;
	setAttr ".imn" -type "string" "persp";
	setAttr ".den" -type "string" "persp_depth";
	setAttr ".man" -type "string" "persp_mask";
	setAttr ".tp" -type "double3" 82.541351318359375 114.51197052001953 13.969179153442383 ;
	setAttr ".hc" -type "string" "viewSet -p %camera";
	setAttr ".ai_translator" -type "string" "perspective";
createNode transform -s -n "top";
	rename -uid "062449A4-430B-9613-B1AC-82B712A5428C";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 82.292972946897919 1000.1 3.9169055668169874 ;
	setAttr ".r" -type "double3" -90 0 0 ;
createNode camera -s -n "topShape" -p "top";
	rename -uid "73DE6242-42A5-B78A-2E8A-908EF4572B31";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 24.856806675086567;
	setAttr ".imn" -type "string" "top";
	setAttr ".den" -type "string" "top_depth";
	setAttr ".man" -type "string" "top_mask";
	setAttr ".hc" -type "string" "viewSet -t %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "front";
	rename -uid "01F5CDDB-4695-6640-E7D2-ED98F479FB2B";
	setAttr ".v" no;
	setAttr ".t" -type "double3" -19.544716424352472 106.23441950901207 1005.329441680052 ;
createNode camera -s -n "frontShape" -p "front";
	rename -uid "F9A47573-4EFA-108B-BCD3-52B26EC4D218";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 998.80777681179882;
	setAttr ".ow" 108.56461823087969;
	setAttr ".imn" -type "string" "front";
	setAttr ".den" -type "string" "front_depth";
	setAttr ".man" -type "string" "front_mask";
	setAttr ".tp" -type "double3" -1.434821440745047 102.06374608051294 6.5216648682532306 ;
	setAttr ".hc" -type "string" "viewSet -f %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -s -n "side";
	rename -uid "B06AB9AD-4E1E-2701-5483-7884F341604E";
	setAttr ".v" no;
	setAttr ".t" -type "double3" 1000.1 48.032131454117611 -17.172457255352143 ;
	setAttr ".r" -type "double3" 0 90 0 ;
createNode camera -s -n "sideShape" -p "side";
	rename -uid "F9D869B4-4937-D99A-C547-FCAE7219757B";
	setAttr -k off ".v" no;
	setAttr ".rnd" no;
	setAttr ".coi" 1000.1;
	setAttr ".ow" 125.62220442616818;
	setAttr ".imn" -type "string" "side";
	setAttr ".den" -type "string" "side_depth";
	setAttr ".man" -type "string" "side_mask";
	setAttr ".hc" -type "string" "viewSet -s %camera";
	setAttr ".o" yes;
	setAttr ".ai_translator" -type "string" "orthographic";
createNode transform -n "zoe_grp";
	rename -uid "A618C58E-4099-6FCF-EDDA-FFAFD8C5534C";
createNode transform -n "jnt_grp" -p "zoe_grp";
	rename -uid "9D6C7AE6-4E00-3B19-9526-548879DA7E30";
createNode joint -n "Root" -p "jnt_grp";
	rename -uid "971C0FBC-4FCD-33AC-E2F6-40AD6A6950AA";
	setAttr ".mnrl" -type "double3" -360 -360 -360 ;
	setAttr ".mxrl" -type "double3" 360 360 360 ;
	setAttr ".bps" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".ds" 2;
createNode joint -n "Hips" -p "Root";
	rename -uid "B23FDFA2-40A7-71F9-4551-87874D938907";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".t" -type "double3" 0 77.81851934289314 -2.4799224056567195 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -1.969136246771086e-05 0 0 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" 1 0 0 0 0 0.99999999999994094 -3.4367910926518332e-07 0
		 0 3.4367910926518332e-07 0.99999999999994094 0 0 77.81851934289314 -2.4799224056567195 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftThigh" -p "Hips";
	rename -uid "46888911-4DA3-7A87-81B1-BDA908252BFD";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 11.085550909274247 9.9475983006414026e-14 -3.1758851788410425e-06 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -89.998234842691815 -88.0189404972445 89.998235897709975 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" 1.0643622975203826e-06 0.03456946559682289 0.99940229739940911 0
		 -3.6816075008050391e-08 0.99940229739997599 -0.034569465596803288 0 -0.99999999999943279 3.6587907394596962e-13 1.064998837452195e-06 0
		 11.085550909274247 77.818519342892145 -2.4799255815418983 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftShin" -p "LeftThigh";
	rename -uid "68518FA7-4655-2518-F085-55BD2718AB85";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 1.5026153034003453e-05 -30.605605324025163 -4.8094285567401585e-06 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -0.00013660380500367768 1.5166066558187092e-21 -9.7219524093651071 ;
	setAttr ".bps" -type "matrix" 1.055293843066579e-06 -0.13469309112924827 0.99088736554713119 0
		 2.5276345160753826e-06 0.99088736554487711 0.13469309112624986 0 -0.99999999999624856 2.3624603169274798e-06 1.3861322422531532e-06 0
		 11.085556845497058 47.231207588190543 -1.4218911440569297 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFoot" -p "LeftShin";
	rename -uid "1B4E768F-4993-3868-E2CD-5D9B5493D8BD";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" -1.0921728869612544 -34.653836435463575 -0.063964963294683486 ;
	setAttr -av ".tx";
	setAttr -av ".ty";
	setAttr -av ".tz";
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 82.757297128642264 -89.999938964845285 0 ;
	setAttr ".bps" -type "matrix" -0.99999999999455702 2.2189765607907141e-06 2.4416892862243512e-06 0
		 -1.7849728233816293e-06 0.25854215053435631 -0.96599997742954613 0 -2.7748109065777625e-06 -0.96599997742864696 -0.25854215052898816 0
		 11.149433063995088 13.04026688770864 -7.1717438962799216 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftToe" -p "LeftFoot";
	rename -uid "2C80225D-4C1F-C0E9-3756-099158AF67E7";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 1.8607282688876126e-05 -16.018315386852841 4.6289644530953762 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 7.9907853140627241 1.1507139492052347e-05 4.7098845234304269e-06 ;
	setAttr ".bps" -type "matrix" -0.99999999999412292 2.4342384922603404e-06 2.4142061493161435e-06 0
		 -2.0998929836733036e-06 0.12174445558238514 -0.992561477960201 0 -2.7100475688381637e-06 -0.99256147795943761 -0.12174445557655791 0
		 11.149430204468992 4.4272776224872814 7.1051659814991881 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftToeTip" -p "LeftToe";
	rename -uid "8925FD06-4771-5401-B505-C3A8A3917FFC";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 2.8543049541696064e-06 -7.5375959248883433 0.80237944098316927 ;
	setAttr ".ro" 2;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightThigh" -p "Hips";
	rename -uid "8A38463E-41F5-AB02-3309-A2B0ACA0BF13";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -11.085550909274616 2.7000623958883807e-13 -3.1836587623956802e-06 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -89.998455487351762 88.018940497464399 -89.998456410492508 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" 9.3131701250914745e-07 -0.034569465596827477 -0.99940229739954189 0
		 3.2214063257207659e-08 0.99940229739997577 -0.034569465596812468 0 0.99999999999956579 3.2259708941794981e-13 9.3187398486621569e-07 0
		 -11.085550909274616 77.818519342892316 -2.4799255893154819 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightShin" -p "RightThigh";
	rename -uid "D49E7B44-47E8-B38C-ACDB-A3A25ECE7DA5";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -1.7554062649416391e-05 -30.605605323998383 4.8761284414666761e-06 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 0 9.7219747211668341 ;
	setAttr ".bps" -type "matrix" 9.2338206555143039e-07 0.13469347699504458 -0.99088731309575906 0
		 -1.2551766679825129e-07 0.99088731309618927 0.13469347699498613 0 0.99999999999956579 3.2259708941794981e-13 9.3187398486621569e-07 0
		 -11.085547019093429 47.231207675605972 -1.4218886254228149 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFoot" -p "RightShin";
	rename -uid "C5C56F76-4496-07C7-8C3F-F7B369AD823A";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 1.0921804831778825 -34.65384043156125 -0.063968442380502921 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 82.757297128614184 90 0 ;
	setAttr ".bps" -type "matrix" -0.99999999999956579 -3.2259708941794981e-13 -9.3187398486621569e-07 0
		 9.0019007111875906e-07 0.25854252670704364 -0.96599987675109333 0 2.4092936624601543e-07 -0.96599987675151278 -0.25854252670693145 0
		 -11.149510103304838 13.040266428697493 -7.1717627283815171 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightToe" -p "RightFoot";
	rename -uid "BA8DF9F3-469F-C33D-073C-67A871EA96F9";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" -1.9478900199487725e-06 -16.018321354567497 4.628968111573279 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 7.9908126348571606 0 0 ;
	setAttr ".bps" -type "matrix" -0.99999999999956579 -3.2259708941794981e-13 -9.3187398486621569e-07 0
		 9.2494219033241022e-07 0.12174436880739192 -0.9925614886055345 0 1.1345073029111157e-07 -0.99256148860596538 -0.12174436880733916 0
		 -11.149521459694304 4.4272665268157478 7.1051486142799396 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightToeTip" -p "RightToe";
	rename -uid "6CACFFD3-4071-D98A-99F7-EB8DD713F1E4";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 9.7394501885617046e-07 -7.5376040769892585 0.8023797300781812 ;
	setAttr ".ro" 2;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "Spine1" -p "Hips";
	rename -uid "36A0D7A9-4AF6-192C-2E5F-B3876EA41BF8";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 3.1827530619569895e-05 5.8072581441909108 -4.0375236209479377 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -5.464151399792172e-05 0 180 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -1 1.224646799147281e-16 -4.2088552109542019e-23 0
		 -1.2246467991467961e-16 -0.99999999999981393 -6.0999521827307612e-07 0 -1.1679142126486115e-22 -6.0999521827307612e-07 0.99999999999981393 0
		 3.1827530619569895e-05 83.625776099471182 -6.5174480224377263 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "Spine2" -p "Spine1";
	rename -uid "DA8E63E8-4C77-BF7E-E9BF-D3B100B0D706";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 1.2256430181878386e-06 -4.8964681776063941 -4.4136486412327258e-06 ;
	setAttr ".ro" 2;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -1 1.224646799147281e-16 -4.2088552109542019e-23 0
		 -1.2246467991467961e-16 -0.99999999999981393 -6.0999521827307612e-07 0 -1.1679142126486115e-22 -6.0999521827307612e-07 0.99999999999981393 0
		 3.0601887601981701e-05 88.522244277079352 -6.517449449264193 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "Spine3" -p "Spine2";
	rename -uid "A4C548B4-4EAD-4809-D8D6-E8803EAD64A3";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 1.1191058320036939e-06 -4.8964767606752133 -5.0943986042994993e-06 ;
	setAttr ".ro" 2;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -1 1.224646799147281e-16 -4.2088552109542019e-23 0
		 -1.2246467991467961e-16 -0.99999999999981393 -6.0999521827307612e-07 0 -1.1679142126486115e-22 -6.0999521827307612e-07 0.99999999999981393 0
		 2.9482781770577653e-05 93.418721037756768 -6.517451556835387 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "Spine4" -p "Spine3";
	rename -uid "17B2F5A5-4EC3-4E05-A8E5-F3ACFF75B52E";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 3.3991225791396621e-05 -10.243134990503094 -7.8185294150046047e-06 ;
	setAttr ".ro" 2;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -1 1.224646799147281e-16 -4.2088552109542019e-23 0
		 -1.2246467991467961e-16 -0.99999999999981393 -6.0999521827307612e-07 0 -1.1679142126486115e-22 -6.0999521827307612e-07 0.99999999999981393 0
		 -4.5084440195645462e-06 103.66185602826272 -6.5174531271014375 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftShoulder" -p "Spine4";
	rename -uid "DD576055-4602-99BF-F33C-08B58D996EBC";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" -8.0951607724919334 -11.930441314516642 1.9579656172026985 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 4.5990091166459038e-05 -90.000000000000014 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" 3.4450928483976522e-16 0.99999999999998157 -1.9268329587395456e-07 0
		 -1.0000000000000002 3.4450928483971814e-16 9.3357595138061394e-23 0 1.4032702365475886e-22 1.9268329587395466e-07 0.99999999999998135 0
		 8.0951562640479153 115.59229614842748 -4.5594802323869494 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftArm" -p "LeftShoulder";
	rename -uid "D28B2450-4F9B-D589-44DE-839C912D77CA";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 0 -6.0096235904520601 -1.3322676295501878e-14 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 0 -89.999908447265639 0 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" 6.9081725713135678e-22 1.7905799497557819e-06 0.99999999999839695 0
		 -1.0000000000000002 3.4450928483971814e-16 9.3357595138061394e-23 0 -3.445092848391012e-16 -0.99999999999839717 1.7905799497557815e-06 0
		 14.104779854499977 115.59229614842748 -4.5594802323869628 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftForeArm" -p "LeftArm";
	rename -uid "AC9F18D5-4582-1910-F2CF-0DAEDCCDA964";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 7;
	setAttr ".t" -type "double3" 6.2948349999203401e-05 -23.717423350771863 2.5365555245571159e-05 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -3.1149174443219238e-05 -1.4204728442202825e-05 12.542897407324961 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.21717050700210644 1.4999261239545814e-06 0.97613368494597008 0
		 -0.97613368494700614 1.5479449813163118e-07 -0.21717050700257473 0 -4.7683984067621428e-07 -0.99999999999886335 1.4305116148836816e-06 0
		 37.822203205271848 115.59227078298494 -4.5594172839915448 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftHand" -p "LeftForeArm";
	rename -uid "4F66E2A9-426F-1762-0E6B-21962688EF74";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".t" -type "double3" -5.1376402550928901e-05 -26.224886087155717 1.0375666619211188e-05 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -2.732075699896086e-05 0 0 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.21717050700210644 1.4999261239545814e-06 0.97613368494597008 0
		 -0.97613368494666775 6.3163166190020554e-07 -0.21717050700323215 0 -9.4229665846580376e-07 -0.99999999999867584 1.3269566462701063e-06 0
		 63.421209056277071 115.59225634777317 1.135804373418531 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger1Metacarpal" -p "LeftHand";
	rename -uid "58AFDE65-4CFE-9616-AD7C-87B196E0FF25";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 5.4072208819614582 -3.8726170666372184 3.1073936686244679 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -56.832536362735112 -79.28353879694798 90.685405569039943 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.18101586878862777 -0.98255929945734799 -0.042549715587580389 0
		 -0.67546119297935336 0.15565289024879225 -0.72078037885066371 0 0.71483245031658094 -0.10173200483172999 -0.69185631974226391 0
		 66.027109195426391 112.48486834351712 7.254997153412023 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger1Proximal" -p "LeftFinger1Metacarpal";
	rename -uid "3C5365BC-44F5-8FE0-3137-08B0163520C0";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -0.04982271546519712 -3.5176358293642807 0.15252437060705759 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -15.426973324489699 -1.708184055419548 -4.6998569118104001 ;
	setAttr ".bps" -type "matrix" -0.10369858707700999 -0.99460080675390272 -0.0039797289754190425 0
		 -0.85429223872664861 0.09111746310088692 -0.51174444674023534 0 0.50934406238773688 -0.049667324495532614 -0.85912850202272573 0
		 68.521183760895084 111.97077532223085 9.6870350318135188 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger1Distal" -p "LeftFinger1Proximal";
	rename -uid "39DD7AE1-4EB9-B8DD-4630-0B8514FF30AB";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 1.4831294862460709e-05 -2.8255350434597233 0.0049684028313379258 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -0.49707725992669116 0 0 ;
	setAttr ".bps" -type "matrix" -0.10369858707700999 -0.99460080675390272 -0.0039797289754190425 0
		 -0.85867891672737395 0.091544924234378822 -0.50427179656889964 0 0.50191345967819556 -0.048874963441499011 -0.86353582261679007 0
		 70.937545507270258 111.71305821867466 11.128718343867495 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger1Tip" -p "LeftFinger1Distal";
	rename -uid "7A8E1FF1-4F77-8D60-39C3-2D8FC0B9BBB8";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 0.21606096026204114 -3.4677021438558029 -0.10192187255753282 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 4.5029227400733172 0 0 ;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger2Metacarpal" -p "LeftHand";
	rename -uid "F4EF8905-4F29-65B0-F9CB-75AF62F41F24";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 4.3710861732510544 -10.9202836196135 0.57215929924363707 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -2.7320756436780807e-05 0 10.000043869017436 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.38337574172836564 1.5868208397053509e-06 0.92359246459231548 0
		 -0.92359246459264388 8.3841225862091717e-07 -0.38337574172994221 0 -1.3826998606986711e-06 -0.99999999999838973 1.1441488486874845e-06 0
		 73.131594207014501 115.02009670723974 7.7741331164516012 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger2Proximal" -p "LeftFinger2Metacarpal";
	rename -uid "D2F09CE1-4E94-45EB-3204-C094827D7965";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 0.6448025649445448 -2.9402442543605503 0.10707387152810099 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.686531695228393 -3.0846620632437669 -11.602383446676619 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.18951558148487385 -0.053810121514065841 0.98040211913127329 0
		 -0.95233476106361825 0.25316435005645943 -0.17019493156493296 0 -0.23904465533525726 -0.96592560929045268 -0.099223838227092187 0
		 75.599979834748723 114.91302139376114 9.4968863509753039 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger2Medial" -p "LeftFinger2Proximal";
	rename -uid "3C97F29F-4A03-AC39-F30F-E7A8E07FE271";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 1.6576829287696278 -3.6463047905600874 -0.89860879299882868 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.999938964856797 -1.1039875150850772e-05 4.4052465678271929e-05 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.18951635975710426 -0.053810112982605358 0.98040196915612876 0
		 -0.85801580879540318 0.49453704102606444 -0.13871548907874437 0 -0.4773807927028344 -0.86748924304223185 -0.13989278739245159 0
		 78.973133521272203 114.76869613741351 11.831828214989002 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger2Distal" -p "LeftFinger2Medial";
	rename -uid "EE62C07C-4501-1E31-62DA-0DA1391D01D4";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 0.6847218354283644 -1.4436307890707383 -0.65925321667600656 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.999969482418967 9.7155512663137332e-06 4.3903391225694828e-05 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.18951693627047231 -0.053809586940537217 0.98040188658526262 0
		 -0.70522460346053129 0.70220850155928316 -0.097782815524011871 0 -0.68318488679170208 -0.70993503131706026 -0.17102824845110984 0
		 80.396740393830783 114.58981735323371 12.795609571800497 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger2Tip" -p "LeftFinger2Distal";
	rename -uid "815CF8BF-4BFB-0FFC-35AB-8BB1351C397B";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 0.81629235025281943 -1.6292459370088821 -1.6592152626967334 ;
	setAttr ".ro" 2;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger3Metacarpal" -p "LeftHand";
	rename -uid "647C93B4-4074-1AB5-7407-E6BF87E9BE3B";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 2.7874952015914403 -11.360092462575309 0.58695092421757522 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -2.7320758137895256e-05 -5.4641511609465181e-05 5.0089565775141458e-06 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.21717059233923014 5.462518933224261e-07 0.9761336659611376 0
		 -0.97613366596055207 1.1084687144195361e-06 -0.21717059233972014 0 -1.2006434770490958e-06 -0.99999999999923661 2.9248805586671623e-07 0
		 73.904815673828125 115.00530242919916 6.3238501548766992 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger3Proximal" -p "LeftFinger3Metacarpal";
	rename -uid "B2DD9B9B-408C-9790-64F8-9E90E3A22CF4";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 0.58568087739668151 -3.1751866546784555 0.15088333597884684 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.999908447254409 2.3142501094499631e-05 3.4695134339599326e-05 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.21717118343089309 9.5016540579431552e-07 0.97613353445434037 0
		 -0.94287266107991574 0.25881857235077738 -0.20977152236274552 0 -0.25264168712883445 -0.96592595296192485 -0.056207039766327904 0
		 76.877029418945341 114.85441589355464 7.5851101875305256 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger3Medial" -p "LeftFinger3Proximal";
	rename -uid "F5429067-420B-BB66-4AE6-E3844D388521";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 0.55966803728485104 -4.0822109216644051 -1.056620354418385 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.999938964859023 -3.886562542555635e-05 2.0976121064425375e-05 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.21717169999397715 3.8969992575014285e-07 0.97613341952910027 0
		 -0.84535705527238569 0.49999865359562568 -0.18807656819434568 0 -0.48806546878766882 -0.86602618112988339 -0.10858522816048002 0
		 80.871437072753892 114.81848144531247 9.0471420288085849 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger3Distal" -p "LeftFinger3Medial";
	rename -uid "3D98A2E4-47DA-7EB0-8363-808A105AE622";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 0.37205726183347387 -1.7515088903389398 -0.78321876111968436 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.999969482396439 6.1341609267155317e-05 2.5158720385795903e-05 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.21717154866297325 1.5364295190188434e-06 0.97613345319631661 0
		 -0.69023178889432901 0.70710530522223336 -0.1535648557655902 0 -0.69022937930159156 -0.70710825714611159 -0.15356209371042134 0
		 82.653549194335923 114.62101745605467 9.8247833251953107 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger3Tip" -p "LeftFinger3Distal";
	rename -uid "605CCE09-4273-ECE3-3A5C-D295B9720B9A";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 0.4652483648342205 -1.8300077977984053 -1.8020325800152648 ;
	setAttr ".ro" 2;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger4Metacarpal" -p "LeftHand";
	rename -uid "1B446A57-4440-11CA-AAF9-4C8AF9223E10";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 1.0085095576160121 -11.469564155327234 0.59928491768179981 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -2.7374228190370484 9.6730458229486498 -10.144177999934755 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.041258120010411799 0.16802699327053813 0.98491862459071666 0
		 -0.99764775459101096 0.047080735141768887 -0.049823309183805516 0 -0.054742353737494059 -0.98465747034741657 0.16568928992637372 0
		 74.398017883300739 114.99296569824213 4.6110963821410973 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger4Proximal" -p "LeftFinger4Metacarpal";
	rename -uid "F5B0FDE3-4A5A-21F8-C029-4C98ED15F299";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 0.11118757800097967 -3.1965053604863414 0.060054165403670368 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.860509725799409 2.0642774837032181 7.7307590837675306 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.17299940624571572 0.20818886802577036 0.96266744032857898 0
		 -0.93450302402361063 0.27401703158577972 -0.22719763311189084 0 -0.31108729245881683 -0.93892068974491483 0.14714834297258134 0
		 77.579129381925299 114.80202160781616 4.8898179054434534 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger4Medial" -p "LeftFinger4Proximal";
	rename -uid "D5710AB3-412D-18E1-8848-6DAE7B0782C3";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 0.19995656228240222 -3.6262642785000168 -0.74124653054073519 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -15.000061035154902 -2.6440810420883363e-05 -3.042044709119519e-06 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.17299950018979188 0.2081884201848033 0.96266752029713665 0
		 -0.82214474145584182 0.50769161010962094 -0.25754077952978249 0 -0.54235523140335773 -0.83600646571976744 0.083330620087420176 0
		 81.163884325772983 114.54596386855826 5.7971150398429137 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger4Distal" -p "LeftFinger4Medial";
	rename -uid "33D4448A-4C8E-AF77-CD92-DD9359B8B838";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 0.086806628514121797 -2.0458776170653774 -0.9390146541886395 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.999969482422454 1.0943480840801476e-05 -2.7969832150171345e-06 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.17299935646577957 0.20818855507808273 0.96266751695324515 0
		 -0.65375936759677278 0.70676647255400926 -0.27033283661632956 0 -0.73666132784468508 -0.67612031385550264 0.013835073185300625 0
		 83.340153857023012 114.31038342422234 6.329329204576795 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger4Tip" -p "LeftFinger4Distal";
	rename -uid "76B32B27-4F1A-9526-EFEF-9C9B0CB122C5";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 0.25782473128227323 -1.4655348144748679 -2.0618737597377788 ;
	setAttr ".ro" 2;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger5Metacarpal" -p "LeftHand";
	rename -uid "E2B3AB9C-4FA1-701A-679D-3C93F60BD1EA";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -1.2769470400995697 -11.385502266890555 0.62140930221775648 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -5.3222540323732419 8.7092844033369978 -20.230582055211165 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" 0.13223082972480757 0.15142217244419789 0.9795847759957117 0
		 -0.98861828399812857 0.091688864845417828 0.11927715878555452 0 -0.071755809624619457 -0.98420753794900318 0.16182282295608696 0
		 74.812295989586943 114.9708379387863 2.3619294780555631 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger5Proximal" -p "LeftFinger5Metacarpal";
	rename -uid "93628F3D-4A9C-9DF5-7971-E590F868AE08";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 0.56151288445837011 -2.2066097044284874 -0.025637005767919163 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.132722092099474 5.0785476788301063 19.370062636172488 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.19599782531448973 0.2597045830686403 0.94558890750956603 0
		 -0.92511631654904847 0.27080352998047352 -0.26613013546916392 0 -0.32518402993798989 -0.92694065488749533 0.18718004431570687 0
		 77.069879607750977 114.8787740349777 2.6446321624580529 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger5Medial" -p "LeftFinger5Proximal";
	rename -uid "F4B6BCC7-420A-B39D-B3F4-4E9DA718037F";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" -0.6341885105891798 -3.8382286072092811 -0.7818169538898303 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.999877929318469 -0.00028883149686086042 -7.5880862710268822e-05 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.19599823938710698 0.25969955165678243 0.94559020353767442 0
		 -0.80943160815122694 0.50148493142356232 -0.30550504951771829 0 -0.55353876276451752 -0.82526905093088965 0.11191886209551975 0
		 80.999221475580271 114.39936443578469 2.9200783086972684 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger5Distal" -p "LeftFinger5Medial";
	rename -uid "55E17D20-407D-2A7D-FAB0-B48A28CC354F";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" -0.22644272717940694 -1.6150771953024847 -0.87305004865024216 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.999938964858998 3.3070161106175411e-05 -2.4053064351255639e-05 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.19599758009021284 0.25969981746217824 0.94559026719234585 0
		 -0.63858536386140474 0.69799195007482051 -0.32406167729731106 0 -0.7441731530099549 -0.66735540938907556 0.029035769291712074 0
		 82.834165426672868 114.25112166959498 3.1016597547425167 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "LeftFinger5Tip" -p "LeftFinger5Distal";
	rename -uid "298BB3B7-48B9-488C-3862-FC8E9C4D20DD";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" -0.21006365693737195 -0.92292148673050178 -0.82507845007341984 ;
	setAttr ".ro" 2;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "Neck" -p "Spine4";
	rename -uid "466C3B37-46B5-978B-70B8-45ACA8E46E53";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 4.2745600694615817e-06 -20.723714828491183 2.0447770203779951 ;
	setAttr ".ro" 2;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -1 1.224646799147281e-16 -4.2088552109542019e-23 0
		 -1.2246467991467961e-16 -0.99999999999981393 -6.0999521827307612e-07 0 -1.1679142126486115e-22 -6.0999521827307612e-07 0.99999999999981393 0
		 -8.7830040864882046e-06 124.38556960944584 -4.4726634653568729 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "Head" -p "Neck";
	rename -uid "486C5770-4BBB-E9B3-AFAB-64B1F37AEEF4";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 1.1071419976360651e-05 -6.5280709316599257 3.2691204969736987e-06 ;
	setAttr ".ro" 2;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -1 1.224646799147281e-16 -4.2088552109542019e-23 0
		 -1.2246467991467961e-16 -0.99999999999981393 -6.0999521827307612e-07 0 -1.1679142126486115e-22 -6.0999521827307612e-07 0.99999999999981393 0
		 -1.9854424062049395e-05 130.91364054110255 -4.4726562141443234 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "HeadVertex" -p "Head";
	rename -uid "AB83E471-4817-F753-D122-039C222B4323";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 7;
	setAttr ".t" -type "double3" 4.7295655306073159e-05 -38.396622969136359 6.9823848471983752e-06 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -179.99992370605469 -89.999984741210966 0 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightShoulder" -p "Spine4";
	rename -uid "A793F8A8-4A1F-AA3B-C516-49BBC29927B1";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 8.0951645871884708 -11.930440479367334 1.9579510127804181 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 4.963256184651935e-05 4.96325602702985e-05 90.000053405804707 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" 9.3210713180102283e-07 -0.999999999998476 -1.4762468111835485e-06 0
		 0.99999999999919043 9.321058531027831e-07 8.6625218900132038e-07 0 -8.662508129817069e-07 -1.4762476186221966e-06 0.99999999999853517 0
		 -8.0951690956324889 115.59229531328708 -4.5594948368097397 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightArm" -p "RightShoulder";
	rename -uid "1AD0BBC5-4A72-CB24-2DF3-17804E27B6F3";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 6;
	setAttr ".t" -type "double3" 4.9055821307320002e-06 -6.0096064243160754 1.1575549013542741e-05 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 4.0981161873787642e-05 89.99993896484375 0 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" 8.662518059217934e-07 4.1098318262756602e-07 -0.99999999999954048 0
		 0.99999999999960132 2.1684964711261348e-07 8.6625189504340436e-07 0 2.1685000302434873e-07 -0.9999999999998922 -4.1098299478073134e-07 0
		 -14.104775519949154 115.59228480609853 -4.5594884671026881 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightForeArm" -p "RightArm";
	rename -uid "C431B0B9-4F7A-59E7-2E0F-11BD03A50E22";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 7;
	setAttr ".t" -type "double3" -1.9903410774624319e-05 -23.717423350764452 4.7897425076826039e-05 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 1.1029944211093263e-05 -4.9578714918294017e-05 -12.542519990357837 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.2171632314609544 -5.112286512752634e-07 -0.9761353035830509 0
		 0.97613530358316059 1.0841649606224248e-07 -0.21716323146103564 0 2.1684923512040485e-07 -0.99999999999986366 4.7548425808471093e-07 0
		 -37.822198870711006 115.59223176555039 -4.559489108974522 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightHand" -p "RightForeArm";
	rename -uid "A26BAF15-4952-03A4-62CF-A8B8B50AB0F3";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".t" -type "double3" 4.778624861678793e-05 -26.224880365109435 4.7538656602341689e-05 ;
	setAttr ".ro" 2;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.2171632314609544 -5.112286512752634e-07 -0.9761353035830509 0
		 0.97613530358316059 1.0841649606224248e-07 -0.21716323146103564 0 2.1684923512040485e-07 -0.99999999999986366 4.7548425808471093e-07 0
		 -63.421240804745025 115.59218138365972 1.13554400997001 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger1Metacarpal" -p "RightHand";
	rename -uid "CC140707-44DB-D072-855F-17913A1A4D3D";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -5.4392936303533057 -4.0489084358150222 2.4202447506994389 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -66.226371366635988 75.382958644845232 -100.30743878104143 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.23255371341714759 0.96763415142189846 0.097994486466933983 0
		 0.659493845579328 0.23094328393668387 -0.71535520355102611 0 -0.71483329386569894 -0.10173174827242092 -0.691855485903344 0
		 -66.192308163459003 113.17193897471489 7.3243057397120062 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger1Proximal" -p "RightFinger1Metacarpal";
	rename -uid "0B01FCC1-4EE1-FDBB-37F2-D49458C37250";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" 0.049822729695179646 -3.5176344599174314 0.15252437018153486 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -15.42697328438355 1.7081845430381799 4.6998582572469916 ;
	setAttr ".bps" -type "matrix" -0.15634798699884489 0.98589870367565036 0.059657799591347871 0
		 0.84344050144345051 0.16469891655510058 -0.51135348577123929 0 -0.51396831369864593 -0.029631283742836384 -0.85729724106491911 0
		 -68.632782399507164 112.39225852479012 9.7400213853711559 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger1Distal" -p "RightFinger1Proximal";
	rename -uid "56D17848-4C21-EB2C-F35A-549A5274EF0D";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" -1.483128455959104e-05 -2.8255329910435165 0.004968402831273977 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -0.49707725992669116 0 0 ;
	setAttr ".bps" -type "matrix" -0.15634798699884489 0.98589870367565036 0.059657799591347871 0
		 0.84786770564095482 0.16494978539926708 -0.50389673746500807 0 -0.50663168149312598 -0.0282013188948354 -0.86170123878293214 0
		 -71.018502645101407 111.92673446017631 11.180607246661342 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger1Tip" -p "RightFinger1Distal";
	rename -uid "28FBD376-42E1-6BB4-2BE1-48AF64DA94BD";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" -8.9088370458512145e-06 -3.1444735135516453 -0.045086072476205885 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 4.5032279158545663 1.2806616723537428e-05 9.4787915988671662e-23 ;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger2Metacarpal" -p "RightHand";
	rename -uid "C3CDB438-44F4-09B4-519A-3782FA404579";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -3.8240183337967046 -11.016804231228562 0.57208631900888918 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -2.7320756278847455e-05 0 -10.000030517577029 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.38336864257221343 -5.2228827589299538e-07 -0.92359541136369117 0
		 0.92359541136360501 4.9483235522460853e-07 -0.38336864257245751 0 6.5725383993721728e-07 -0.99999999999974143 2.9267984670078193e-07 0
		 -73.344696044921861 115.02009582519533 7.2607483863830522 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger2Proximal" -p "RightFinger2Metacarpal";
	rename -uid "B11F7F48-4D49-731D-4559-27A5BE64AC7F";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -0.96261274218649362 -3.0054828804931759 0.12455651066835571 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.686531744942359 3.0846618214581691 11.602382522822746 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.18950802248440729 0.053811089570047037 -0.98040352715263823 0
		 0.95233624973033337 0.25316380500322166 -0.17018741224266601 0 0.23904471728865651 -0.96592569821678087 -0.099222823285830264 0
		 -75.75151062011723 114.89553833007818 9.3020210266113263 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger2Medial" -p "RightFinger2Proximal";
	rename -uid "DE1D213C-498D-70B8-17C4-8FA061D1C16F";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" -1.6577118538028657 -3.6462921762163205 -0.89860661931388108 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.999938964856797 1.103987239028691e-05 -4.4052469192290629e-05 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.18950880075784116 0.053811081038960699 -0.98040337718346493 0
		 0.85801723070800795 0.49453653756132548 -0.13870848865522706 0 0.4773812378419226 -0.86748947000771992 -0.13988986089863506 0
		 -79.124664306640597 114.75121307373044 11.636962890624988 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger2Distal" -p "RightFinger2Medial";
	rename -uid "8537442F-4082-873E-24B9-2F9C5FD73BE4";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" -0.68473412666692823 -1.443625976378426 -0.65925098927971248 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.999969482418967 -9.7155512663137332e-06 -4.3903391225694828e-05 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.18950937727222328 0.053810554997239857 -0.98040329461746667 0
		 0.70522586171851676 0.70220807399325291 -0.097776811065109881 0 0.68318568478069697 -0.70993538085488872 -0.17102360983546872 0
		 -80.548271179199205 114.57233428955077 12.60074424743652 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger2Tip" -p "RightFinger2Distal";
	rename -uid "1FD0E677-4F81-5129-5D01-059EA2E9AF21";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" -0.68314673915297064 -1.5245507618155543 -1.2327284098626023 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 1.3732692734822388e-05 -2.7320755947283946e-05 1.079061166819976e-05 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger3Metacarpal" -p "RightHand";
	rename -uid "1BF17748-414C-202D-A32D-46BF33FDE0FA";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -2.7878414979780288 -11.360096929333665 0.58687914806313302 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -2.7320759956885086e-05 5.4641511609464809e-05 -5.0089570322614975e-06 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.21716331679753553 4.4244562509849046e-07 -0.97613528459804066 0
		 0.97613528459802523 5.852536667637949e-07 -0.21716331679726689 0 4.7520379501656947e-07 -0.9999999999997311 -5.5898241361673878e-07 0
		 -73.904815673828125 115.00530242919922 6.3238501548767028 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger3Proximal" -p "RightFinger3Metacarpal";
	rename -uid "96D6549A-41D3-C8E8-C494-BA9279F5FC83";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -0.58570469256488344 -3.1751822103179848 0.15088441821508525 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.999908447254409 -2.3142493722308367e-05 -3.4695123797541777e-05 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.21716390789029205 3.8532558125162541e-08 -0.97613515309603305 0
		 0.94287441232587199 0.25881806696444337 -0.20976427435083106 0 0.25264140533760204 -0.96592608837984484 -0.056205979185972928 0
		 -76.877029418945341 114.85441589355466 7.5851101875305273 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger3Medial" -p "RightFinger3Proximal";
	rename -uid "B74C9D34-4E46-1764-D53C-32B8C28E83A7";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" -0.55969950079392916 -4.0822073018696443 -1.0566176733609609 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.999938964859023 3.8865629063535171e-05 -2.0976121064425382e-05 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.21716442445384215 5.9899837638183635e-07 -0.97613503817416236 0
		 0.84535881978051264 0.49999820047854759 -0.18806984164802554 0 0.48806564985760942 -0.86602644273593388 -0.10858232780344107 0
		 -80.871437072753878 114.81848144531253 9.0471420288085902 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger3Distal" -p "RightFinger3Medial";
	rename -uid "383ADB37-4EF5-3386-DBA6-A69A14F95EE1";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" -0.37207168161928195 -1.751506714575811 -0.78321677671132761 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.999969482396439 -6.1341617955477419e-05 -2.5158725656823163e-05 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.21716427312342296 -5.4773147532385796e-07 -0.97613507184122639 0
		 0.69023344641936091 0.70710493525386975 -0.15355910908725776 0 0.69023001088247882 -0.70710862711419464 -0.15355755122380774 0
		 -82.653549194335895 114.62101745605462 9.8247833251953036 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger3Tip" -p "RightFinger3Distal";
	rename -uid "F6545942-4030-3891-EB57-CEB202628438";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" -0.34904781395218443 -1.5115746288989449 -1.1930692957170947 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 4.0981147321872271e-05 -3.6158720393626908e-28 5.008947027816788e-06 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger4Metacarpal" -p "RightHand";
	rename -uid "423AA10E-47C8-8044-6839-E5BE465114D6";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" -1.0088566821861029 -11.469581875158298 0.59921495768217881 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -2.7374226005165476 -9.6730389783071313 10.144183597474564 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.04125080550614009 -0.1680260069442655 -0.98491909923376975 0
		 0.99764816538221168 0.047080051030841175 -0.049815729488192392 0 0.054740379562092559 -0.98465767136873494 0.16568874753615284 0
		 -74.398017883300767 114.99296569824219 4.6110963821411115 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger4Proximal" -p "RightFinger4Metacarpal";
	rename -uid "449B07D0-47C2-F742-D616-309AF57E80AA";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -0.36042879146511808 -3.1626707786423935 0.050994894076325181 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.860509692574857 -2.0642777282889013 -7.7307600061429715 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.1729923048143798 -0.20818781113457993 -0.96266894505328315 0
		 0.93450493804019974 0.27401656254287499 -0.22719032600590508 0 0.31108549187239726 -0.93892106097753503 0.14714978083343982 0
		 -77.535591125488281 114.8544158935547 5.132089614868157 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger4Medial" -p "RightFinger4Proximal";
	rename -uid "D836525C-47DC-D37C-08BA-E28579457282";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" -0.1999836550310512 -3.6262643899620386 -0.74123867625567641 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -15.000061035154902 2.6440808896138322e-05 3.0420458072497317e-06 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.17299239875749722 -0.20818736329348619 -0.96266902502211682 0
		 0.82214705628006968 0.5076912531313712 -0.25753409355639589 0 0.54235398755991759 -0.83600694570009704 0.083333900179053483 0
		 -81.120346069335952 114.59835815429683 6.039386749267587 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger4Distal" -p "RightFinger4Medial";
	rename -uid "8D0651A5-4472-2C0F-DAF7-DA8D09EEEFEE";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" -0.08682313296374744 -2.0458790122799311 -0.93901008846489731 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.999969482422454 -1.0943481573750615e-05 2.7969838738955441e-06 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.17299225503359311 -0.20818749818687959 -0.96266902167727419 0
		 0.65376192547534584 0.70676625196725684 -0.27032722740953263 0 0.736660725502019 -0.67612086987375641 0.013839971965093067 0
		 -83.296615600585966 114.36277770996098 6.5716009140014719 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger4Tip" -p "RightFinger4Distal";
	rename -uid "41EFF626-4CA1-FC0B-4332-0F974A3BCEB3";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" -0.043322267041215667 -1.1917562768532761 -1.1480624461327977 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" 1.366037849948043e-05 0 0 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger5Metacarpal" -p "RightHand";
	rename -uid "2E397759-4FE7-EDEB-97B3-20A6968FD5FD";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 1;
	setAttr ".t" -type "double3" 1.1410634809456131 -11.435485955778816 0.59921386227797768 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -5.3222520733182783 -8.7092801060535123 20.230579881341736 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" 0.13223798548509658 -0.15142136014226454 -0.97958393560098278 0
		 0.98861746752119939 0.091688013498302273 0.11928458028054342 0 0.071753871720023815 -0.98420774223402752 0.16182243979060684 0
		 -74.831619262695313 114.99296569824216 2.5050790309906068 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger5Proximal" -p "RightFinger5Metacarpal";
	rename -uid "B8AD9DAC-41C8-1177-4F13-6A8CA9E9E3B9";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 2;
	setAttr ".t" -type "double3" -0.56152887638739557 -2.2066056847086983 -0.025632720300933443 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.132722749603472 -5.0785458159693917 -19.370055208540126 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.19599087972225515 -0.25970352052219814 -0.94559063896279827 0
		 0.92511852028597108 0.27080311932497708 -0.26612289264127142 0 0.32518194674611295 -0.9269410725565238 0.18718159503052015 0
		 -77.089202880859389 114.90090179443359 2.7877817153930642 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger5Medial" -p "RightFinger5Proximal";
	rename -uid "609E48A8-4143-3638-27F4-82B24FF52B35";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 3;
	setAttr ".t" -type "double3" 0.2185870054454071 -3.7812691648060337 -0.79706898922461278 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.999877929318469 0.00028883149686086042 7.5880862710268822e-05 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.19599129378145241 -0.25969848910877869 -0.94559193498913174 0
		 0.80943427594634809 0.50148464285768013 -0.30549845482606969 0 0.55353732095052399 -0.82526956064823009 0.11192223453091847 0
		 -80.889358520507827 114.5589904785156 3.4381735324859757 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger5Distal" -p "RightFinger5Medial";
	rename -uid "0766063A-4CE0-E88B-7CBF-0E92208264E4";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	addAttr -ci true -sn "liw" -ln "lockInfluenceWeights" -min 0 -max 1 -at "bool";
	setAttr ".uoc" 1;
	setAttr ".oc" 4;
	setAttr ".t" -type "double3" 0.2088961267608731 -1.6740535865492152 -0.8730464057163374 ;
	setAttr ".ro" 2;
	setAttr ".jo" -type "double3" -14.999938964858998 -3.3070161576962618e-05 2.4053062594246292e-05 ;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".bps" -type "matrix" -0.19599063448429074 -0.25969875491461203 -0.94559199863907795 0
		 0.63858831391999937 0.69799180326525323 -0.32405618015913901 0 0.7441724507929981 -0.66735597642511635 0.02904073364125398 0
		 -82.768600463867188 114.38572692871091 3.6543505191802925 1;
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode joint -n "RightFinger5Tip" -p "RightFinger5Distal";
	rename -uid "319DB08A-4D22-083F-6A9E-2AA8F49BEAF6";
	addAttr -is true -ci true -h true -k true -sn "filmboxTypeID" -ln "filmboxTypeID" 
		-smn 4 -smx 4 -at "short";
	setAttr ".uoc" 1;
	setAttr ".oc" 5;
	setAttr ".t" -type "double3" 0.21005472303906103 -0.92292471595239078 -0.82507711241044035 ;
	setAttr ".ro" 2;
	setAttr -av ".is" -type "double3" 1 1 1 ;
	setAttr -av ".is";
	setAttr ".radi" 3;
	setAttr -k on ".filmboxTypeID" 4;
createNode fosterParent -n "zoeRNfosterParent1";
	rename -uid "6EE09A40-4584-C31F-4FB4-C0BD22381938";
createNode mesh -n "Body_geoShapeDeformed" -p "zoeRNfosterParent1";
	rename -uid "515812CC-48B8-CAB3-C39B-9FBB5CC9608A";
	setAttr -k off ".v";
	setAttr -s 8 ".iog[0].og";
	setAttr -av ".iog[0].og[8].gid";
	setAttr -av ".iog[0].og[9].gid";
	setAttr -av ".iog[0].og[12].gid";
	setAttr -av ".iog[0].og[13].gid";
	setAttr -av ".iog[0].og[14].gid";
	setAttr -av ".iog[0].og[15].gid";
	setAttr -av ".iog[0].og[16].gid";
	setAttr -av ".iog[0].og[17].gid";
	setAttr ".vir" yes;
	setAttr ".vif" yes;
	setAttr ".pv" -type "double2" 0.5 0.5 ;
	setAttr ".uvst[0].uvsn" -type "string" "DiffuseUV";
	setAttr ".cuvs" -type "string" "DiffuseUV";
	setAttr ".dcc" -type "string" "Ambient+Diffuse";
	setAttr ".covm[0]"  0 1 1;
	setAttr ".cdvm[0]"  0 1 1;
	setAttr -s 492 ".pt";
	setAttr ".pt[312]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[313]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[314]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[315]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[316]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[317]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[318]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[319]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[320]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[321]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[322]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[323]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[324]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[325]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[326]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[327]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[328]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[329]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[330]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[331]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[332]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[333]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[334]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[335]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[336]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[337]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[338]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[339]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[340]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[341]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[342]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[343]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[344]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[345]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[346]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[347]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[348]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[349]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[350]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[351]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[352]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[353]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[354]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[355]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[356]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[357]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[358]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[359]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[360]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[361]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[362]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[363]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[364]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[365]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[366]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[367]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[368]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[369]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[370]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[371]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[372]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[373]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[374]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[375]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[376]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[377]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[378]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[379]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[380]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[381]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[382]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[383]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[384]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[385]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[386]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[387]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[388]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[389]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[390]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[391]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[392]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[393]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[394]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[395]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[396]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[397]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[398]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[399]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[400]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[401]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[402]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[403]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[404]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[405]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[406]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[407]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[408]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[409]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[410]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[411]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[412]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[413]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[414]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[415]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[416]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[417]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[418]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[419]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[420]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[421]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[422]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[423]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[424]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[425]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[426]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[427]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[428]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[429]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[430]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[431]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[432]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[433]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[434]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[435]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[436]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[437]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[438]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[439]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[440]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[441]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[442]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[443]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[444]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[445]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[446]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[447]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[448]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[449]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[450]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[451]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[452]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[453]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[454]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[455]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[456]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[457]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[458]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[459]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[460]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[461]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[462]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[463]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[464]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[465]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[466]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[467]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[468]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[469]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[470]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[471]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[472]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[473]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[474]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[475]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[476]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[477]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[478]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[479]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[480]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[481]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[482]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[483]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[484]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[485]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[486]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[487]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[488]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[489]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[490]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[491]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[492]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[493]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[494]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[495]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[496]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[497]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[498]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[499]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[500]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[501]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[502]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[503]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[504]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[505]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[506]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[507]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[508]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[509]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[510]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[511]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[512]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[513]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[514]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[515]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[516]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[517]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[518]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[519]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[520]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[521]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[522]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[523]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[524]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[525]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[526]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[527]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[528]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[529]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[530]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[531]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[532]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[533]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[534]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[535]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[536]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[537]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[538]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[539]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[540]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[541]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[542]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[543]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[544]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[545]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[546]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[547]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[548]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[549]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[550]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[551]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[552]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[553]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[554]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[555]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[556]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[557]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[558]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[559]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[560]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[561]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[562]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[563]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[564]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[565]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[566]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[567]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[568]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[569]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[570]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[571]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[572]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[573]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[574]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[575]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[576]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[577]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[578]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[579]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[580]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[581]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[582]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[583]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[584]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[585]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[586]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[587]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[588]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[589]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[590]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[591]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[592]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[593]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[594]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[595]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[596]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[597]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[598]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[599]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[600]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[601]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[602]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[603]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[604]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[605]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[606]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[607]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[608]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[609]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[610]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[611]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[612]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[613]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[614]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[615]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[616]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[617]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[618]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[619]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[620]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[621]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[622]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[623]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[624]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[625]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[626]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[627]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[628]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[629]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[630]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[631]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[632]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[633]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[634]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[635]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[636]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[637]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[638]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[639]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[640]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[641]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[642]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[643]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[644]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[645]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[646]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[647]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[648]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[649]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[650]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[651]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[652]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[653]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[654]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[655]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[656]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[657]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[658]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[659]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[660]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[661]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[662]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[663]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[664]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[665]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[666]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[667]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[668]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[669]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[670]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[671]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[672]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[673]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[674]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[675]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[676]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[677]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[678]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[679]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[680]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[681]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[682]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[683]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[684]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[685]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[686]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[687]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[688]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[689]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[690]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[691]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[692]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[693]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[694]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[695]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[696]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[697]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[698]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[699]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[700]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[701]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[702]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[703]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[704]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[705]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[706]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[707]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[708]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[709]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[710]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[711]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[712]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[713]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[714]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[715]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[716]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[717]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[718]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[719]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[720]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[721]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[722]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[723]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[724]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[725]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[726]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[727]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[728]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[729]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[730]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[731]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[732]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[733]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[734]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[735]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[736]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[737]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[738]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[739]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[740]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[741]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[742]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[743]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[744]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[745]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[746]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[747]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[748]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[749]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[750]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[751]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[752]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[753]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[754]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[755]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[756]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[757]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[758]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[759]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[760]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[761]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[762]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[763]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[764]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[765]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[766]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[767]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[768]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[769]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[770]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[771]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[772]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[773]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[774]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[775]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[776]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[777]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[778]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[779]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[780]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[781]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[782]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[783]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[784]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[785]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[786]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[787]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[788]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[789]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[790]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[791]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[792]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[793]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[794]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[795]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[796]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[797]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[798]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[799]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[800]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".pt[801]" -type "float3" 0 -1.5497208e-06 0 ;
	setAttr ".dr" 1;
	setAttr ".vcs" 2;
	setAttr ".ai_translator" -type "string" "polymesh";
createNode lightLinker -s -n "lightLinker1";
	rename -uid "848564AC-4989-1CEC-89A3-48B2ECADFA6E";
	setAttr -s 46 ".lnk";
	setAttr -s 46 ".slnk";
createNode shapeEditorManager -n "shapeEditorManager";
	rename -uid "8F0A787B-4EFA-241F-5F63-E5BFBE443F30";
createNode poseInterpolatorManager -n "poseInterpolatorManager";
	rename -uid "871A3D6F-42AF-6DDB-78A3-33841423E8E6";
createNode displayLayerManager -n "layerManager";
	rename -uid "0662E83A-4083-DA4B-0879-BD9CF19E217C";
createNode displayLayer -n "defaultLayer";
	rename -uid "36E8F2D7-4EEE-D814-2C1D-9186FF6D6D4E";
createNode renderLayerManager -n "renderLayerManager";
	rename -uid "A2941D92-415B-8713-370C-D4B9D608843D";
createNode renderLayer -n "defaultRenderLayer";
	rename -uid "7636929C-4FF0-760D-C506-C38781EE9BA4";
	setAttr ".g" yes;
createNode script -n "uiConfigurationScriptNode";
	rename -uid "AA9877F2-4DF5-FADF-DC78-EC994CC80BB0";
	setAttr ".b" -type "string" (
		"// Maya Mel UI Configuration File.\n//\n//  This script is machine generated.  Edit at your own risk.\n//\n//\n\nglobal string $gMainPane;\nif (`paneLayout -exists $gMainPane`) {\n\n\tglobal int $gUseScenePanelConfig;\n\tint    $useSceneConfig = $gUseScenePanelConfig;\n\tint    $nodeEditorPanelVisible = stringArrayContains(\"nodeEditorPanel1\", `getPanel -vis`);\n\tint    $nodeEditorWorkspaceControlOpen = (`workspaceControl -exists nodeEditorPanel1Window` && `workspaceControl -q -visible nodeEditorPanel1Window`);\n\tint    $menusOkayInPanels = `optionVar -q allowMenusInPanels`;\n\tint    $nVisPanes = `paneLayout -q -nvp $gMainPane`;\n\tint    $nPanes = 0;\n\tstring $editorName;\n\tstring $panelName;\n\tstring $itemFilterName;\n\tstring $panelConfig;\n\n\t//\n\t//  get current state of the UI\n\t//\n\tsceneUIReplacement -update $gMainPane;\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Top View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Top View\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"top\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 0\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n"
		+ "            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n"
		+ "            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 454\n            -height 312\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Side View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Side View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"side\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 1\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n"
		+ "            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n"
		+ "            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 453\n            -height 312\n"
		+ "            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Front View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Front View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"front\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n            -wireframeOnShaded 1\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n"
		+ "            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n"
		+ "            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 0\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n"
		+ "            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 454\n            -height 312\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"modelPanel\" (localizedPanelLabel(\"Persp View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tmodelPanel -edit -l (localizedPanelLabel(\"Persp View\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        modelEditor -e \n            -camera \"persp\" \n            -useInteractiveMode 0\n            -displayLights \"default\" \n            -displayAppearance \"smoothShaded\" \n            -activeOnly 0\n            -ignorePanZoom 0\n"
		+ "            -wireframeOnShaded 1\n            -headsUpDisplay 1\n            -holdOuts 1\n            -selectionHiliteDisplay 1\n            -useDefaultMaterial 0\n            -bufferMode \"double\" \n            -twoSidedLighting 0\n            -backfaceCulling 0\n            -xray 0\n            -jointXray 1\n            -activeComponentsXray 0\n            -displayTextures 0\n            -smoothWireframe 0\n            -lineWidth 1\n            -textureAnisotropic 0\n            -textureHilight 1\n            -textureSampling 2\n            -textureDisplay \"modulate\" \n            -textureMaxSize 16384\n            -fogging 0\n            -fogSource \"fragment\" \n            -fogMode \"linear\" \n            -fogStart 0\n            -fogEnd 100\n            -fogDensity 0.1\n            -fogColor 0.5 0.5 0.5 1 \n            -depthOfFieldPreview 1\n            -maxConstantTransparency 1\n            -rendererName \"vp2Renderer\" \n            -objectFilterShowInHUD 1\n            -isFiltered 0\n            -colorResolution 256 256 \n            -bumpResolution 512 512 \n"
		+ "            -textureCompression 0\n            -transparencyAlgorithm \"frontAndBackCull\" \n            -transpInShadows 0\n            -cullingOverride \"none\" \n            -lowQualityLighting 0\n            -maximumNumHardwareLights 1\n            -occlusionCulling 0\n            -shadingModel 0\n            -useBaseRenderer 0\n            -useReducedRenderer 0\n            -smallObjectCulling 0\n            -smallObjectThreshold -1 \n            -interactiveDisableShadows 0\n            -interactiveBackFaceCull 0\n            -sortTransparent 1\n            -controllers 1\n            -nurbsCurves 1\n            -nurbsSurfaces 1\n            -polymeshes 1\n            -subdivSurfaces 1\n            -planes 1\n            -lights 1\n            -cameras 1\n            -controlVertices 1\n            -hulls 1\n            -grid 1\n            -imagePlane 1\n            -joints 1\n            -ikHandles 1\n            -deformers 1\n            -dynamics 1\n            -particleInstancers 1\n            -fluids 1\n            -hairSystems 1\n            -follicles 1\n"
		+ "            -nCloths 1\n            -nParticles 1\n            -nRigids 1\n            -dynamicConstraints 1\n            -locators 1\n            -manipulators 1\n            -pluginShapes 1\n            -dimensions 1\n            -handles 1\n            -pivots 1\n            -textures 1\n            -strokes 1\n            -motionTrails 1\n            -clipGhosts 1\n            -greasePencils 1\n            -shadows 0\n            -captureSequenceNumber -1\n            -width 918\n            -height 672\n            -sceneRenderFilter 0\n            $editorName;\n        modelEditor -e -viewSelected 0 $editorName;\n        modelEditor -e \n            -pluginObjects \"gpuCacheDisplayFilter\" 1 \n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"ToggledOutliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"ToggledOutliner\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -docTag \"isolOutln_fromSeln\" \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 1\n            -showReferenceMembers 1\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n"
		+ "            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -isSet 0\n            -isSetMember 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            -renderFilterIndex 0\n            -selectionOrder \"chronological\" \n"
		+ "            -expandAttribute 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"outlinerPanel\" (localizedPanelLabel(\"Outliner\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\toutlinerPanel -edit -l (localizedPanelLabel(\"Outliner\")) -mbv $menusOkayInPanels  $panelName;\n\t\t$editorName = $panelName;\n        outlinerEditor -e \n            -showShapes 0\n            -showAssignedMaterials 0\n            -showTimeEditor 1\n            -showReferenceNodes 0\n            -showReferenceMembers 0\n            -showAttributes 0\n            -showConnected 0\n            -showAnimCurvesOnly 0\n            -showMuteInfo 0\n            -organizeByLayer 1\n            -organizeByClip 1\n            -showAnimLayerWeight 1\n            -autoExpandLayers 1\n            -autoExpand 0\n            -showDagOnly 1\n            -showAssets 1\n            -showContainedOnly 1\n            -showPublishedAsConnected 0\n            -showParentContainers 0\n"
		+ "            -showContainerContents 1\n            -ignoreDagHierarchy 0\n            -expandConnections 0\n            -showUpstreamCurves 1\n            -showUnitlessCurves 1\n            -showCompounds 1\n            -showLeafs 1\n            -showNumericAttrsOnly 0\n            -highlightActive 1\n            -autoSelectNewObjects 0\n            -doNotSelectNewObjects 0\n            -dropIsParent 1\n            -transmitFilters 0\n            -setFilter \"defaultSetFilter\" \n            -showSetMembers 1\n            -allowMultiSelection 1\n            -alwaysToggleSelect 0\n            -directSelect 0\n            -displayMode \"DAG\" \n            -expandObjects 0\n            -setsIgnoreFilters 1\n            -containersIgnoreFilters 0\n            -editAttrName 0\n            -showAttrValues 0\n            -highlightSecondary 0\n            -showUVAttrsOnly 0\n            -showTextureNodesOnly 0\n            -attrAlphaOrder \"default\" \n            -animLayerFilterOptions \"allAffecting\" \n            -sortOrder \"none\" \n            -longNames 0\n"
		+ "            -niceNames 1\n            -showNamespace 1\n            -showPinIcons 0\n            -mapMotionTrails 0\n            -ignoreHiddenAttribute 0\n            -ignoreOutlinerColor 0\n            -renderFilterVisible 0\n            $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"graphEditor\" (localizedPanelLabel(\"Graph Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Graph Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n"
		+ "                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 1\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 1\n                -showCompounds 0\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n                -highlightActive 0\n                -autoSelectNewObjects 1\n                -doNotSelectNewObjects 0\n                -dropIsParent 1\n                -transmitFilters 1\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n"
		+ "                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 1\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"GraphEd\");\n            animCurveEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 1\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"integer\" \n"
		+ "                -snapValue \"none\" \n                -showResults \"off\" \n                -showBufferCurves \"off\" \n                -smoothness \"fine\" \n                -resultSamples 1\n                -resultScreenSamples 0\n                -resultUpdate \"delayed\" \n                -showUpstreamCurves 1\n                -showCurveNames 0\n                -showActiveCurveNames 0\n                -stackedCurves 0\n                -stackedCurvesMin -1\n                -stackedCurvesMax 1\n                -stackedCurvesSpace 0.2\n                -displayNormalized 0\n                -preSelectionHighlight 0\n                -constrainDrag 0\n                -classicMode 1\n                -valueLinesToggle 1\n                -outliner \"graphEditor1OutlineEd\" \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dopeSheetPanel\" (localizedPanelLabel(\"Dope Sheet\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dope Sheet\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"OutlineEd\");\n            outlinerEditor -e \n                -showShapes 1\n                -showAssignedMaterials 0\n                -showTimeEditor 1\n                -showReferenceNodes 0\n                -showReferenceMembers 0\n                -showAttributes 1\n                -showConnected 1\n                -showAnimCurvesOnly 1\n                -showMuteInfo 0\n                -organizeByLayer 1\n                -organizeByClip 1\n                -showAnimLayerWeight 1\n                -autoExpandLayers 1\n                -autoExpand 0\n                -showDagOnly 0\n                -showAssets 1\n                -showContainedOnly 0\n                -showPublishedAsConnected 0\n                -showParentContainers 1\n                -showContainerContents 0\n                -ignoreDagHierarchy 0\n                -expandConnections 1\n                -showUpstreamCurves 1\n                -showUnitlessCurves 0\n                -showCompounds 1\n                -showLeafs 1\n                -showNumericAttrsOnly 1\n"
		+ "                -highlightActive 0\n                -autoSelectNewObjects 0\n                -doNotSelectNewObjects 1\n                -dropIsParent 1\n                -transmitFilters 0\n                -setFilter \"0\" \n                -showSetMembers 0\n                -allowMultiSelection 1\n                -alwaysToggleSelect 0\n                -directSelect 0\n                -displayMode \"DAG\" \n                -expandObjects 0\n                -setsIgnoreFilters 1\n                -containersIgnoreFilters 0\n                -editAttrName 0\n                -showAttrValues 0\n                -highlightSecondary 0\n                -showUVAttrsOnly 0\n                -showTextureNodesOnly 0\n                -attrAlphaOrder \"default\" \n                -animLayerFilterOptions \"allAffecting\" \n                -sortOrder \"none\" \n                -longNames 0\n                -niceNames 1\n                -showNamespace 1\n                -showPinIcons 0\n                -mapMotionTrails 1\n                -ignoreHiddenAttribute 0\n                -ignoreOutlinerColor 0\n"
		+ "                -renderFilterVisible 0\n                $editorName;\n\n\t\t\t$editorName = ($panelName+\"DopeSheetEd\");\n            dopeSheetEditor -e \n                -displayKeys 1\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"integer\" \n                -snapValue \"none\" \n                -outliner \"dopeSheetPanel1OutlineEd\" \n                -showSummary 1\n                -showScene 0\n                -hierarchyBelow 0\n                -showTicks 1\n                -selectionWindow 0 0 0 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"timeEditorPanel\" (localizedPanelLabel(\"Time Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Time Editor\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"clipEditorPanel\" (localizedPanelLabel(\"Trax Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Trax Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = clipEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 0 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"sequenceEditorPanel\" (localizedPanelLabel(\"Camera Sequencer\")) `;\n"
		+ "\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Camera Sequencer\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = sequenceEditorNameFromPanel($panelName);\n            clipEditor -e \n                -displayKeys 0\n                -displayTangents 0\n                -displayActiveKeys 0\n                -displayActiveKeyTangents 0\n                -displayInfinities 0\n                -displayValues 0\n                -autoFit 0\n                -autoFitTime 0\n                -snapTime \"none\" \n                -snapValue \"none\" \n                -initialized 0\n                -manageSequencer 1 \n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperGraphPanel\" (localizedPanelLabel(\"Hypergraph Hierarchy\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypergraph Hierarchy\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\n\t\t\t$editorName = ($panelName+\"HyperGraphEd\");\n            hyperGraph -e \n                -graphLayoutStyle \"hierarchicalLayout\" \n                -orientation \"horiz\" \n                -mergeConnections 0\n                -zoom 1\n                -animateTransition 0\n                -showRelationships 1\n                -showShapes 0\n                -showDeformers 0\n                -showExpressions 0\n                -showConstraints 0\n                -showConnectionFromSelected 0\n                -showConnectionToSelected 0\n                -showConstraintLabels 0\n                -showUnderworld 0\n                -showInvisible 0\n                -transitionFrames 1\n                -opaqueContainers 0\n                -freeform 0\n                -imagePosition 0 0 \n                -imageScale 1\n                -imageEnabled 0\n                -graphType \"DAG\" \n                -heatMapDisplay 0\n                -updateSelection 1\n                -updateNodeAdded 1\n                -useDrawOverrideColor 0\n                -limitGraphTraversal -1\n"
		+ "                -range 0 0 \n                -iconSize \"smallIcons\" \n                -showCachedConnections 0\n                $editorName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"hyperShadePanel\" (localizedPanelLabel(\"Hypershade\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Hypershade\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"visorPanel\" (localizedPanelLabel(\"Visor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Visor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"nodeEditorPanel\" (localizedPanelLabel(\"Node Editor\")) `;\n\tif ($nodeEditorPanelVisible || $nodeEditorWorkspaceControlOpen) {\n"
		+ "\t\tif (\"\" == $panelName) {\n\t\t\tif ($useSceneConfig) {\n\t\t\t\t$panelName = `scriptedPanel -unParent  -type \"nodeEditorPanel\" -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels `;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n"
		+ "                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\t}\n\t\t} else {\n\t\t\t$label = `panel -q -label $panelName`;\n\t\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Node Editor\")) -mbv $menusOkayInPanels  $panelName;\n\n\t\t\t$editorName = ($panelName+\"NodeEditorEd\");\n            nodeEditor -e \n                -allAttributes 0\n                -allNodes 0\n                -autoSizeNodes 1\n                -consistentNameSize 1\n                -createNodeCommand \"nodeEdCreateNodeCommand\" \n                -connectNodeOnCreation 0\n                -connectOnDrop 0\n                -copyConnectionsOnPaste 0\n                -connectionStyle \"bezier\" \n                -defaultPinnedState 1\n                -additiveGraphingMode 0\n                -settingsChangedCallback \"nodeEdSyncControls\" \n"
		+ "                -traversalDepthLimit -1\n                -keyPressCommand \"nodeEdKeyPressCommand\" \n                -nodeTitleMode \"name\" \n                -gridSnap 0\n                -gridVisibility 1\n                -crosshairOnEdgeDragging 0\n                -popupMenuScript \"nodeEdBuildPanelMenus\" \n                -showNamespace 1\n                -showShapes 1\n                -showSGShapes 0\n                -showTransforms 1\n                -useAssets 1\n                -syncedSelection 1\n                -extendToShapes 1\n                -editorMode \"default\" \n                -hasWatchpoint 0\n                $editorName;\n\t\t\tif (!$useSceneConfig) {\n\t\t\t\tpanel -e -l $label $panelName;\n\t\t\t}\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"createNodePanel\" (localizedPanelLabel(\"Create Node\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Create Node\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"polyTexturePlacementPanel\" (localizedPanelLabel(\"UV Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"UV Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"renderWindowPanel\" (localizedPanelLabel(\"Render View\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Render View\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"shapePanel\" (localizedPanelLabel(\"Shape Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tshapePanel -edit -l (localizedPanelLabel(\"Shape Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n"
		+ "\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextPanel \"posePanel\" (localizedPanelLabel(\"Pose Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tposePanel -edit -l (localizedPanelLabel(\"Pose Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynRelEdPanel\" (localizedPanelLabel(\"Dynamic Relationships\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Dynamic Relationships\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"relationshipPanel\" (localizedPanelLabel(\"Relationship Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Relationship Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n"
		+ "\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"referenceEditorPanel\" (localizedPanelLabel(\"Reference Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Reference Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"componentEditorPanel\" (localizedPanelLabel(\"Component Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Component Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"dynPaintScriptedPanelType\" (localizedPanelLabel(\"Paint Effects\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Paint Effects\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"scriptEditorPanel\" (localizedPanelLabel(\"Script Editor\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Script Editor\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"profilerPanel\" (localizedPanelLabel(\"Profiler Tool\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Profiler Tool\")) -mbv $menusOkayInPanels  $panelName;\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"contentBrowserPanel\" (localizedPanelLabel(\"Content Browser\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Content Browser\")) -mbv $menusOkayInPanels  $panelName;\n"
		+ "\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\t$panelName = `sceneUIReplacement -getNextScriptedPanel \"Stereo\" (localizedPanelLabel(\"Stereo\")) `;\n\tif (\"\" != $panelName) {\n\t\t$label = `panel -q -label $panelName`;\n\t\tscriptedPanel -edit -l (localizedPanelLabel(\"Stereo\")) -mbv $menusOkayInPanels  $panelName;\n{ string $editorName = ($panelName+\"Editor\");\n            stereoCameraView -e \n                -camera \"persp\" \n                -useInteractiveMode 0\n                -displayLights \"default\" \n                -displayAppearance \"smoothShaded\" \n                -activeOnly 0\n                -ignorePanZoom 0\n                -wireframeOnShaded 0\n                -headsUpDisplay 1\n                -holdOuts 1\n                -selectionHiliteDisplay 1\n                -useDefaultMaterial 0\n                -bufferMode \"double\" \n                -twoSidedLighting 0\n                -backfaceCulling 0\n                -xray 0\n                -jointXray 0\n                -activeComponentsXray 0\n                -displayTextures 0\n"
		+ "                -smoothWireframe 0\n                -lineWidth 1\n                -textureAnisotropic 0\n                -textureHilight 1\n                -textureSampling 2\n                -textureDisplay \"modulate\" \n                -textureMaxSize 16384\n                -fogging 0\n                -fogSource \"fragment\" \n                -fogMode \"linear\" \n                -fogStart 0\n                -fogEnd 100\n                -fogDensity 0.1\n                -fogColor 0.5 0.5 0.5 1 \n                -depthOfFieldPreview 1\n                -maxConstantTransparency 1\n                -objectFilterShowInHUD 1\n                -isFiltered 0\n                -colorResolution 4 4 \n                -bumpResolution 4 4 \n                -textureCompression 0\n                -transparencyAlgorithm \"frontAndBackCull\" \n                -transpInShadows 0\n                -cullingOverride \"none\" \n                -lowQualityLighting 0\n                -maximumNumHardwareLights 0\n                -occlusionCulling 0\n                -shadingModel 0\n"
		+ "                -useBaseRenderer 0\n                -useReducedRenderer 0\n                -smallObjectCulling 0\n                -smallObjectThreshold -1 \n                -interactiveDisableShadows 0\n                -interactiveBackFaceCull 0\n                -sortTransparent 1\n                -controllers 1\n                -nurbsCurves 1\n                -nurbsSurfaces 1\n                -polymeshes 1\n                -subdivSurfaces 1\n                -planes 1\n                -lights 1\n                -cameras 1\n                -controlVertices 1\n                -hulls 1\n                -grid 1\n                -imagePlane 1\n                -joints 1\n                -ikHandles 1\n                -deformers 1\n                -dynamics 1\n                -particleInstancers 1\n                -fluids 1\n                -hairSystems 1\n                -follicles 1\n                -nCloths 1\n                -nParticles 1\n                -nRigids 1\n                -dynamicConstraints 1\n                -locators 1\n                -manipulators 1\n"
		+ "                -pluginShapes 1\n                -dimensions 1\n                -handles 1\n                -pivots 1\n                -textures 1\n                -strokes 1\n                -motionTrails 1\n                -clipGhosts 1\n                -greasePencils 1\n                -shadows 0\n                -captureSequenceNumber -1\n                -width 0\n                -height 0\n                -sceneRenderFilter 0\n                -displayMode \"centerEye\" \n                -viewColor 0 0 0 1 \n                -useCustomBackground 1\n                $editorName;\n            stereoCameraView -e -viewSelected 0 $editorName;\n            stereoCameraView -e \n                -pluginObjects \"gpuCacheDisplayFilter\" 1 \n                $editorName; };\n\t\tif (!$useSceneConfig) {\n\t\t\tpanel -e -l $label $panelName;\n\t\t}\n\t}\n\n\n\tif ($useSceneConfig) {\n        string $configName = `getPanel -cwl (localizedPanelLabel(\"Current Layout\"))`;\n        if (\"\" != $configName) {\n\t\t\tpanelConfiguration -edit -label (localizedPanelLabel(\"Current Layout\")) \n"
		+ "\t\t\t\t-userCreated false\n\t\t\t\t-defaultImage \"vacantCell.xP:/\"\n\t\t\t\t-image \"\"\n\t\t\t\t-sc false\n\t\t\t\t-configString \"global string $gMainPane; paneLayout -e -cn \\\"single\\\" -ps 1 100 100 $gMainPane;\"\n\t\t\t\t-removeAllPanels\n\t\t\t\t-ap false\n\t\t\t\t\t(localizedPanelLabel(\"Persp View\")) \n\t\t\t\t\t\"modelPanel\"\n"
		+ "\t\t\t\t\t\"$panelName = `modelPanel -unParent -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels `;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 1\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 1\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 918\\n    -height 672\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t\t\"modelPanel -edit -l (localizedPanelLabel(\\\"Persp View\\\")) -mbv $menusOkayInPanels  $panelName;\\n$editorName = $panelName;\\nmodelEditor -e \\n    -cam `findStartUpCamera persp` \\n    -useInteractiveMode 0\\n    -displayLights \\\"default\\\" \\n    -displayAppearance \\\"smoothShaded\\\" \\n    -activeOnly 0\\n    -ignorePanZoom 0\\n    -wireframeOnShaded 1\\n    -headsUpDisplay 1\\n    -holdOuts 1\\n    -selectionHiliteDisplay 1\\n    -useDefaultMaterial 0\\n    -bufferMode \\\"double\\\" \\n    -twoSidedLighting 0\\n    -backfaceCulling 0\\n    -xray 0\\n    -jointXray 1\\n    -activeComponentsXray 0\\n    -displayTextures 0\\n    -smoothWireframe 0\\n    -lineWidth 1\\n    -textureAnisotropic 0\\n    -textureHilight 1\\n    -textureSampling 2\\n    -textureDisplay \\\"modulate\\\" \\n    -textureMaxSize 16384\\n    -fogging 0\\n    -fogSource \\\"fragment\\\" \\n    -fogMode \\\"linear\\\" \\n    -fogStart 0\\n    -fogEnd 100\\n    -fogDensity 0.1\\n    -fogColor 0.5 0.5 0.5 1 \\n    -depthOfFieldPreview 1\\n    -maxConstantTransparency 1\\n    -rendererName \\\"vp2Renderer\\\" \\n    -objectFilterShowInHUD 1\\n    -isFiltered 0\\n    -colorResolution 256 256 \\n    -bumpResolution 512 512 \\n    -textureCompression 0\\n    -transparencyAlgorithm \\\"frontAndBackCull\\\" \\n    -transpInShadows 0\\n    -cullingOverride \\\"none\\\" \\n    -lowQualityLighting 0\\n    -maximumNumHardwareLights 1\\n    -occlusionCulling 0\\n    -shadingModel 0\\n    -useBaseRenderer 0\\n    -useReducedRenderer 0\\n    -smallObjectCulling 0\\n    -smallObjectThreshold -1 \\n    -interactiveDisableShadows 0\\n    -interactiveBackFaceCull 0\\n    -sortTransparent 1\\n    -controllers 1\\n    -nurbsCurves 1\\n    -nurbsSurfaces 1\\n    -polymeshes 1\\n    -subdivSurfaces 1\\n    -planes 1\\n    -lights 1\\n    -cameras 1\\n    -controlVertices 1\\n    -hulls 1\\n    -grid 1\\n    -imagePlane 1\\n    -joints 1\\n    -ikHandles 1\\n    -deformers 1\\n    -dynamics 1\\n    -particleInstancers 1\\n    -fluids 1\\n    -hairSystems 1\\n    -follicles 1\\n    -nCloths 1\\n    -nParticles 1\\n    -nRigids 1\\n    -dynamicConstraints 1\\n    -locators 1\\n    -manipulators 1\\n    -pluginShapes 1\\n    -dimensions 1\\n    -handles 1\\n    -pivots 1\\n    -textures 1\\n    -strokes 1\\n    -motionTrails 1\\n    -clipGhosts 1\\n    -greasePencils 1\\n    -shadows 0\\n    -captureSequenceNumber -1\\n    -width 918\\n    -height 672\\n    -sceneRenderFilter 0\\n    $editorName;\\nmodelEditor -e -viewSelected 0 $editorName;\\nmodelEditor -e \\n    -pluginObjects \\\"gpuCacheDisplayFilter\\\" 1 \\n    $editorName\"\n"
		+ "\t\t\t\t$configName;\n\n            setNamedPanelLayout (localizedPanelLabel(\"Current Layout\"));\n        }\n\n        panelHistory -e -clear mainPanelHistory;\n        sceneUIReplacement -clear;\n\t}\n\n\ngrid -spacing 5 -size 12 -divisions 5 -displayAxes yes -displayGridLines yes -displayDivisionLines yes -displayPerspectiveLabels no -displayOrthographicLabels no -displayAxesBold yes -perspectiveLabelPosition axis -orthographicLabelPosition edge;\nviewManip -drawCompass 0 -compassAngle 0 -frontParameters \"\" -homeParameters \"\" -selectionLockParameters \"\";\n}\n");
	setAttr ".st" 3;
createNode script -n "sceneConfigurationScriptNode";
	rename -uid "67C8C42B-4B48-2F4D-2796-DB85974834E4";
	setAttr ".b" -type "string" "playbackOptions -min 0 -max 817.1987812925 -ast 0 -aet 817.1987812925 ";
	setAttr ".st" 6;
createNode reference -n "zoeRN";
	rename -uid "3C162BFE-4558-1B7F-98FC-42BEFE181823";
	setAttr ".fn[0]" -type "string" "C:/Users/Dadiu student/Documents/Graduation-Game/GraduationGame unity/Assets/3DAssets/040_model/020_character/zoe/live/zoe.ma";
	setAttr -s 11 ".phl";
	setAttr ".phl[1]" 0;
	setAttr ".phl[2]" 0;
	setAttr ".phl[3]" 0;
	setAttr ".phl[4]" 0;
	setAttr ".phl[5]" 0;
	setAttr ".phl[6]" 0;
	setAttr ".phl[7]" 0;
	setAttr ".phl[8]" 0;
	setAttr ".phl[9]" 0;
	setAttr ".phl[10]" 0;
	setAttr ".phl[11]" 0;
	setAttr ".ed" -type "dataReferenceEdits" 
		"zoeRN"
		"zoeRN" 0
		"zoeRN" 31
		0 "|zoe_geo_grp" "|zoe_grp" "-s -r "
		0 "|zoeRNfosterParent1|Body_geoShapeDeformed" "|zoe_grp|zoe_geo_grp|Body_geo" 
		"-s -r "
		2 "|zoe_grp|zoe_geo_grp|Protese_geo" "visibility" " 1"
		2 "|zoe_grp|zoe_geo_grp|Hair_geo" "visibility" " 1"
		2 "|zoe_grp|zoe_geo_grp|Hair_geo|Hair_geoShape" "dispResolution" " 1"
		2 "|zoe_grp|zoe_geo_grp|Hair_geo|Hair_geoShape" "displaySmoothMesh" " 0"
		2 "|zoe_grp|zoe_geo_grp|Armor_geo|Armor_geoShape" "dispResolution" " 1"
		2 "|zoe_grp|zoe_geo_grp|Armor_geo|Armor_geoShape" "displaySmoothMesh" " 0"
		
		2 "|zoe_grp|zoe_geo_grp|Body_geo" "visibility" " 1"
		2 "|zoe_grp|zoe_geo_grp|Body_geo" "rotatePivot" " -type \"double3\" 0.48849868774414063 86.57087802886962891 -0.2203679084777832"
		
		2 "|zoe_grp|zoe_geo_grp|Body_geo" "scalePivot" " -type \"double3\" 0.48849868774414063 86.57087802886962891 -0.2203679084777832"
		
		2 "|zoe_grp|zoe_geo_grp|Body_geo|Body_geoShape" "intermediateObject" " 1"
		
		2 "|zoe_grp|zoe_geo_grp|Body_geo|Body_geoShape" "uvPivot" " -type \"double2\" 0 0.14184308052062988"
		
		5 3 "zoeRN" "|zoe_grp|zoe_geo_grp|Body_geo|Body_geoShape.worldMesh" 
		"zoeRN.placeHolderList[1]" ""
		5 3 "zoeRN" "Body_geoSG.memberWireframeColor" "zoeRN.placeHolderList[2]" 
		""
		5 0 "zoeRN" "groupId10.message" "Body_geoSG.groupNodes" "zoeRN.placeHolderList[3]" 
		"zoeRN.placeHolderList[4]" ""
		5 4 "zoeRN" "Body_geoSG.dagSetMembers" "zoeRN.placeHolderList[5]" ""
		
		5 3 "zoeRN" "body1SG.memberWireframeColor" "zoeRN.placeHolderList[6]" 
		""
		5 0 "zoeRN" "groupId9.message" "body1SG.groupNodes" "zoeRN.placeHolderList[7]" 
		"zoeRN.placeHolderList[8]" ""
		5 4 "zoeRN" "body1SG.dagSetMembers" "zoeRN.placeHolderList[9]" ""
		5 3 "zoeRN" "groupId9.groupId" "zoeRN.placeHolderList[10]" ""
		5 3 "zoeRN" "groupId10.groupId" "zoeRN.placeHolderList[11]" ""
		8 "|zoe_grp|zoe_geo_grp|Body_geo" "translateX"
		8 "|zoe_grp|zoe_geo_grp|Body_geo" "translateY"
		8 "|zoe_grp|zoe_geo_grp|Body_geo" "translateZ"
		8 "|zoe_grp|zoe_geo_grp|Body_geo" "rotateX"
		8 "|zoe_grp|zoe_geo_grp|Body_geo" "rotateY"
		8 "|zoe_grp|zoe_geo_grp|Body_geo" "rotateZ"
		8 "|zoe_grp|zoe_geo_grp|Body_geo" "scaleX"
		8 "|zoe_grp|zoe_geo_grp|Body_geo" "scaleY"
		8 "|zoe_grp|zoe_geo_grp|Body_geo" "scaleZ";
	setAttr ".ptag" -type "string" "";
lockNode -l 1 ;
createNode reference -n "sharedReferenceNode";
	rename -uid "DEE3C778-43DB-DE8A-5032-5F8BCC9DB9EC";
	setAttr ".ed" -type "dataReferenceEdits" 
		"sharedReferenceNode";
createNode skinCluster -n "skinCluster1";
	rename -uid "1749F112-45E0-4370-8C23-108C30E6BDDD";
	setAttr -s 3178 ".wl";
	setAttr ".wl[0:166].w"
		3 1 0.30437426136747986 2 0.69562540211171509 3 3.3652080523180651e-07
		3 0 3.5674941354710737e-07 1 0.4265333545138435 2 0.57346628873674288
		3 0 3.5902282098376678e-07 1 0.45773234223898657 2 0.54226729873819224
		3 1 0.35762515331390055 2 0.64237437264501318 3 4.7404108621231553e-07
		3 5 0.32679226528546207 6 0.67320742073919038 7 3.1397534764465255e-07
		3 0 3.7006823352508703e-07 5 0.44205610075504459 6 0.55794352917672174
		3 0 3.7031828080721388e-07 5 0.44445199815793435 6 0.55554763152378472
		3 5 0.31821059520005845 6 0.68178900687356525 7 3.9792637631860398e-07
		3 0 4.8919070062782164e-06 1 0.40416612428619286 2 0.59582898380680094
		3 1 0.20394999111480747 2 0.79604910923423422 3 8.9965095832187699e-07
		3 1 0.21439437825139782 2 0.7856024800993211 3 3.1416492810349724e-06
		3 0 1.1251170118561708e-05 1 0.41208562489627787 2 0.58790312393360344
		3 0 5.3073758944903451e-06 5 0.44120486918239615 6 0.55878982344170947
		3 5 0.24380925588181582 6 0.75618804184878163 7 2.7022694025394475e-06
		3 5 0.24460835739685305 6 0.75539057315342928 7 1.069449717622844e-06
		3 0 2.3011137727472515e-06 5 0.45090208267482629 6 0.54909561621140079
		3 0 8.3699930487979649e-06 1 0.4967314897980733 2 0.50326014020887777
		3 1 0.32142691798833167 2 0.67857111441381901 3 1.9675978494123743e-06
		3 1 0.34028297145663794 2 0.65971506338030717 3 1.9651630548714545e-06
		3 0 7.4530398870435942e-06 1 0.49354024417862269 2 0.50645230278149034
		3 0 8.7386938493548245e-06 5 0.47840997379443545 6 0.52158128751171517
		3 5 0.32527914853614809 6 0.67471842975998964 7 2.4217038621122063e-06
		3 5 0.31906528859788613 6 0.68093287050780404 7 1.8408943097068931e-06
		3 0 4.2610985817085985e-06 5 0.48535681713442103 6 0.51463892176699733
		3 1 0.29191566102527244 2 0.70808265176692209 3 1.6872078053683384e-06
		3 0 1.1920037964037052e-06 1 0.44337557384640613 2 0.55662323414979742
		3 0 8.7885124657041457e-06 1 0.44518865966188459 2 0.55480255182564975
		3 1 0.27363078082435305 2 0.72636482816698655 3 4.39100866052191e-06
		3 5 0.26811826444168241 6 0.73187604366654757 7 5.6918917700110539e-06
		3 0 1.1199755471960784e-05 5 0.44670292346801399 6 0.55328587677651409
		3 0 1.8711841034937728e-06 5 0.4287584226184189 6 0.57123970619747755
		3 5 0.26694190780048077 6 0.73305671847447773 7 1.3737250416896705e-06
		3 1 0.39631672205475149 2 0.60368305389758214 3 2.2404766640343377e-07
		3 0 4.6790319660907143e-07 1 0.48297825946432216 2 0.51702127263248132
		3 5 0.38429332057585613 6 0.61570647817424695 7 2.0124989682567064e-07
		3 0 3.4290915722113119e-07 5 0.48617488272874099 6 0.51382477436210172
		3 0 4.6002831175289715e-06 1 0.29822397226995861 2 0.70177142744692367
		3 1 0.12622040420663472 2 0.87377629105135779 3 3.304742007461236e-06
		3 0 2.5816853673621542e-06 5 0.35526059508792585 6 0.64473682322670667
		3 5 0.16138385703138533 6 0.83861297836144422 7 3.1646071705329558e-06
		3 0 4.0304115941247399e-06 1 0.54867003643166323 2 0.45132593315674258
		3 0 1.7657116222868391e-06 1 0.40819352997405262 2 0.59180470431432508
		3 0 3.3761721405755268e-06 5 0.52513199811046352 6 0.47486462571739585
		3 0 1.5478847727748474e-06 5 0.38541501937111766 6 0.61458343274410954
		3 1 0.20588488385869441 2 0.79410752012835151 3 7.5960129541774517e-06
		3 0 3.6721984800359893e-06 1 0.3997590861660037 2 0.60023724163551617
		3 5 0.19504145128034697 6 0.80494915638656273 7 9.3923330902566173e-06
		3 0 5.189864328710273e-06 5 0.398490824662937 6 0.60150398547273443
		3 0 6.6493375822720595e-06 1 0.60980893559746641 2 0.39018441506495133
		3 0 5.6969819331102777e-05 1 0.75701803126467559 2 0.24292499891599317
		3 0 2.0585111066617959e-05 1 0.6788321576451265 2 0.32114725724380688
		3 0 3.3255578743213264e-06 1 0.57391603892901577 2 0.42608063551311015
		3 0 5.3314389900820661e-06 5 0.58715355774666189 6 0.41284111081434782
		3 0 3.7602235031458891e-05 5 0.68733439261161633 6 0.31262800515335237
		3 0 3.3313041068457342e-05 5 0.76076247493441029 6 0.23920421202452144
		3 0 3.9732672726663358e-06 5 0.61727442285224743 6 0.38272160388048004
		3 1 0.025505751057199814 2 0.97447732185385771 3 1.6927088942463558e-05
		3 1 0.065002386535385481 2 0.93499580068527866 3 1.8127793358896105e-06
		3 1 0.094298775162175608 2 0.90569752907570888 3 3.6957621153968588e-06
		3 1 0.04120496674138565 2 0.9586963156609245 3 9.8717597689857348e-05
		3 5 0.035362690778850202 6 0.9645952270707242 7 4.2082150425662677e-05
		3 5 0.07281153442460285 6 0.92718604904989765 7 2.4165254994493971e-06
		3 5 0.066131676220338761 6 0.93386621914472423 7 2.104634937082278e-06
		3 5 0.028558174610941348 6 0.97141041206403456 7 3.1413325024148836e-05
		3 1 0.039308505209322227 2 0.96064489501630168 3 4.6599774376086948e-05
		3 1 0.12154569902989031 2 0.87845290551877653 3 1.3954513331412825e-06
		3 5 0.029790737699491459 6 0.97013022799843951 7 7.9034302069030816e-05
		3 5 0.10493421959219576 6 0.89506451618167626 7 1.2642261280030701e-06
		3 0 4.1810685009198686e-06 1 0.60640306082518913 2 0.39359275810631006
		3 0 2.4788483683731028e-05 1 0.72344567050586739 2 0.27652954101044891
		3 0 2.7287094350260224e-06 5 0.59119123241103333 6 0.40880603887953165
		3 0 1.9008233296331941e-05 5 0.69552158088687954 6 0.30445941087982398
		3 0 0.00031703158574790581 1 0.7745304681141959 2 0.22515250030005629
		3 0 5.3414724853790984e-05 1 0.70917815866637934 2 0.29076842660876695
		3 0 4.251511450304992e-05 1 0.69937943516283119 2 0.30057804972266577
		3 0 0.00014526882268499136 1 0.75701042916435402 2 0.24284430201296101
		3 0 0.00022251867139910257 5 0.74917299987283081 6 0.25060448145577019
		3 0 4.5306937079708436e-05 5 0.69228747145418457 6 0.30766722160873566
		3 0 4.0054837456221238e-05 5 0.70539560726184414 6 0.29456433790069964
		3 0 0.00021584375624993365 5 0.77365656634560909 6 0.22612758989814088
		3 0 0.00032566476942099087 1 0.79728910451506518 2 0.20238523071551381
		3 0 4.1486640752575885e-05 1 0.70288878930796805 2 0.29706972405127924
		3 0 0.00033892192853850032 5 0.7948825275323288 6 0.20477855053913258
		3 0 3.6726187441237662e-05 5 0.700622857758046 6 0.29934041605451289
		3 1 0.056484057024702425 2 0.94341597373055519 3 9.9969244742407633e-05
		3 1 0.12140475073302151 2 0.87857461191242903 3 2.0637354549512917e-05
		3 1 0.1003762765260854 2 0.89960767759007199 3 1.6045883842661775e-05
		3 1 0.042604861603160467 2 0.95735088898277165 3 4.4249414067898644e-05
		3 5 0.038195402899415913 6 0.9617643595561598 7 4.0237544424334405e-05
		3 5 0.089235602003498726 6 0.91074819791346395 7 1.6200083037435395e-05
		3 5 0.10143471282649563 6 0.89854230727419115 7 2.2979899313347405e-05
		3 5 0.053953099215746765 6 0.94596914972847512 7 7.7751055778126484e-05
		3 1 0.074784686407714726 2 0.92517690357213023 3 3.8410020155169912e-05
		3 1 0.15513370482733047 2 0.84485573070162456 3 1.0564471045085479e-05
		3 5 0.05511411962028586 6 0.94483316810645668 7 5.2712273257477483e-05
		3 5 0.13262095854057909 6 0.86736663473496689 7 1.2406724454043014e-05
		3 0 1.9089998972901132e-06 5 0.51514790467930627 6 0.48485018632079652
		3 0 2.3964677457806971e-05 5 0.57637276237372326 6 0.42360327294881917
		3 0 1.1053022435802652e-05 1 0.5713326574964126 2 0.4286562894811517
		3 0 1.3651754348878922e-06 1 0.51728839877027755 2 0.48271023605428753
		3 0 1.5821397076935917e-05 5 0.63725189966392581 6 0.36273227893899729
		3 0 1.1120854616716476e-06 5 0.53460845829400383 6 0.46539042962053451
		3 0 2.3095534680576521e-06 1 0.50929087380265048 2 0.49070681664388155
		3 0 3.3690796290670843e-05 1 0.60571206462380645 2 0.39425424457990305
		3 5 0.10291371663757296 6 0.89706916923077573 7 1.7114131651272494e-05
		3 5 0.17135300982802765 6 0.8286460304070149 7 9.5976495737538038e-07
		3 1 0.20478249377417668 2 0.79521604788247469 3 1.4583433487071997e-06
		3 1 0.12301359778767711 2 0.8769641048302349 3 2.2297382088031157e-05
		3 5 0.15958904274583782 6 0.84041015682982301 7 8.0042433923731426e-07
		3 5 0.08468363403300426 6 0.91530952152371248 7 6.844443283354892e-06
		3 1 0.068488046758888296 2 0.93150761690847717 3 4.3363326346703968e-06
		3 1 0.15348520044876787 2 0.84651404071184488 3 7.5883938707991754e-07
		3 0 9.2792971674893388e-07 5 0.54633073339724469 6 0.45366833867303852
		3 0 1.292439345587029e-06 1 0.54022265963730409 2 0.45977604792335031
		3 5 0.23523976113890202 6 0.76475980880026651 7 4.3006083141241513e-07
		3 1 0.25634911565313528 2 0.74365033744525955 3 5.4690160505310378e-07
		3 0 0.00011785175778184872 5 0.65231913251959805 6 0.34756301572261999
		3 0 2.3621764014808419e-05 5 0.61272003965801014 6 0.38725633857797515
		3 0 1.8411359043091096e-05 1 0.62703910371396099 2 0.372942484926996
		3 0 7.2657121324902279e-05 1 0.6539966014100036 2 0.34593074146867148
		3 0 1.596020951989824e-05 5 0.62952409172998947 6 0.3704599480604906
		3 0 7.4232933006021797e-05 5 0.67120420493225641 6 0.32872156213473758
		3 0 0.00013958310522362127 1 0.66361639402865225 2 0.33624402286612426
		3 0 2.8333180091082653e-05 1 0.64179347471863368 2 0.35817819210127516
		3 0 7.2410820290850666e-06 5 0.63428656708807918 6 0.36570619182989172
		3 0 9.2015339788425887e-06 1 0.64607627488705777 2 0.35391452357896319
		3 5 0.093725451052769262 6 0.90626388856116225 7 1.0660386068542513e-05
		3 5 0.1754379677545542 6 0.82455633055007516 7 5.7016953705250214e-06
		3 1 0.18083946072883367 2 0.81915474352489248 3 5.7957462739401802e-06
		3 1 0.085524687401784497 2 0.91446279715509871 3 1.2515443116768279e-05
		3 5 0.18857668681661549 6 0.81141451228438077 7 8.800899003833503e-06
		3 5 0.11537131168101487 6 0.88458747261934001 7 4.1215699645039404e-05
		3 1 0.12525505722445665 2 0.87469828694871576 3 4.6655826827553852e-05
		3 1 0.20878602608642943 2 0.7912069321595383 3 7.0417540323325131e-06
		3 5 0.24442038827064591 6 0.75557577108503104 7 3.8406443229105686e-06
		3 1 0.26544116315670491 2 0.73455545299149017 3 3.3838518049203187e-06
		3 0 7.1542708747725548e-05 1 0.57094374298035921 2 0.42898471431089313
		3 0 3.4311097429788965e-05 5 0.61192578178720625 6 0.38803990711536407
		3 0 4.0044878638885917e-05 1 0.60694998694067559 2 0.39300996818068556
		3 0 7.3646110870602134e-05 5 0.61885818085607858 6 0.38106817303305091
		3 1 3.7624064725718483e-07 2 0.17599600131267534 3 0.82400362244667746
		3 1 2.129224885549302e-07 2 0.1085221304584827 3 0.89147765661902878
		3 5 1.897955751369812e-07 6 0.10003292041799243 7 0.89996688978643236
		3 5 2.6919388753698433e-07 6 0.16090193431273425 7 0.83909779649337835
		3 5 3.2358897753866631e-07 6 0.16000147109801183 7 0.83999820531301073
		3 1 3.0239407641802385e-07 2 0.16580322567252609 3 0.83419647193339774
		3 1 0.038147340572637932 2 0.96183655583782612 3 1.6103589535827177e-05
		3 5 0.047119563220810873 6 0.95285829772802955 7 2.2139051159567677e-05
		3 5 1.0599100522980036e-06 6 0.58880926680703571 7 0.41118967328291212
		3 5 4.963733302931752e-07 6 0.68089086295032786 7 0.31910864067634187
		3 1 5.3712375589910853e-07 2 0.6811514739497363 3 0.3188479889265079
		3 1 8.9649157896197676e-07 2 0.59891068194455821 3 0.40108842156386276
		3 1 1.5087576088671092e-07 2 0.61718479094216527 3 0.3828150581820739
		3 5 1.1319453471868192e-07 6 0.6163851745282114 7 0.38361471227725397
		3 1 1.1545490117642114e-07 2 0.50401665891173608 3 0.49598322563336267
		3 1 2.352549186390903e-06 2 0.72779243307729169 3 0.27220521437352196
		3 1 1.7854513065772562e-06 2 0.49937459359469721 3 0.50062362095399626
		3 1 3.0496403659836263e-07 2 0.24826115314657299 3 0.75173854188939049
		3 5 3.9873978248844365e-07 6 0.24883124074039159 7 0.75116836051982594
		3 5 2.6487879509360625e-06 6 0.50318051202510239 7 0.4968168391869468
		3 5 2.4478407544641469e-06 6 0.7280232198623463 7 0.27197433229689938
		3 5 1.7735640651424329e-07 6 0.50522449964504668 7 0.49477532299854687
		3 1 1.9548750260645391e-07 2 0.36350871711365057 3 0.63649108739884697
		3 1 1.6509358558676555e-06 2 0.61698358268595843 3 0.38301476637818588
		3 5 3.1572392022691505e-07 6 0.36799278258171192 7 0.63200690169436791
		3 5 2.6938583846536566e-06 6 0.62074582315127702 7 0.37925148299033828
		2 1 5.728546211930391e-07 2 0.27472776762836032;
	setAttr ".wl[166:333].w"
		1 3 0.72527165951701866
		3 1 4.3846101283765924e-06 2 0.51224929686102871 3 0.48774631852884293
		3 1 9.457939265545342e-06 2 0.69723948688141191 3 0.3027510551793226
		3 1 9.7918648410999821e-07 2 0.50181634481115633 3 0.49818267600235966
		3 5 1.0553178090750683e-06 6 0.47170396376361595 7 0.52829498091857496
		3 5 1.2058538500956981e-05 6 0.68619824164610499 7 0.31378969981539412
		3 5 2.8321729210453494e-06 6 0.48177550887245468 7 0.51822165895462424
		3 5 3.0842876546097845e-07 6 0.24350492296879783 7 0.75649476860243681
		3 1 7.8556417321562526e-07 2 0.39051874095199157 3 0.60948047348383527
		3 1 8.0247853000177812e-06 2 0.6131335086799119 3 0.38685846653478811
		3 5 5.615635985667754e-07 6 0.34879582214916743 7 0.65120361628723411
		3 5 7.6176238227437719e-06 6 0.58460347755353781 7 0.41538890482263935
		3 1 0.074924417618450645 2 0.92496241144129387 3 0.00011317094025559123
		3 5 0.066543215116529789 6 0.93337004992442218 7 8.6734959048035215e-05
		3 1 9.6341250817554166e-06 2 0.77299291352472976 3 0.22699745235018842
		3 1 1.1180196071749502e-05 2 0.85745095599424348 3 0.14253786380968467
		3 1 4.1975184255197939e-06 2 0.80082830031497776 3 0.19916750216659676
		3 5 1.1217009169238647e-05 6 0.7747315795956361 7 0.22525720339519459
		3 5 7.0791659814340079e-06 6 0.86100351501599071 7 0.13898940581802788
		3 5 2.8522512235676573e-06 6 0.80208821956312704 7 0.19790892818564951
		3 1 1.6681500299168813e-06 2 0.39870029693344922 3 0.6012980349165209
		3 1 7.7183189112962444e-07 2 0.27303885099464675 3 0.72696037717346218
		3 1 1.3292423218754689e-06 2 0.39219888237689771 3 0.60779978838078041
		3 5 1.1622736013442301e-06 6 0.3810443228245754 7 0.6189545149018234
		3 5 7.029180983191279e-07 6 0.2636914127764371 7 0.73630788430546457
		3 5 1.6084734769342395e-06 6 0.38874391137782693 7 0.61125448014869632
		3 0 0.0004173728018461844 5 0.96273677015738957 6 0.036845857040764263
		3 0 0.00085067643632362987 5 0.93924253687766635 6 0.059906786686010079
		3 0 0.001984698948525486 5 0.94045883599999436 6 0.057556465051480009
		3 0 0.0027370930604388682 5 0.94230638979453674 6 0.054956517145024454
		3 0 0.0040805011985976056 5 0.94183881075047649 6 0.054080688050925904
		3 0 0.0062479423314800815 5 0.9436136304230146 6 0.050138427245505365
		3 0 0.007552343758767982 5 0.94877655559651719 6 0.043671100644714751
		3 0 0.0084012547234015196 5 0.95978757656210012 6 0.031811168714498461
		3 0 0.0060832795255062657 5 0.96273081427909346 6 0.0311859061954004
		3 0 0.0017729487643109874 5 0.95639076299825077 6 0.041836288237438235
		3 0 0.0017583566213050378 5 0.96216828391156006 6 0.036073359467134906
		3 0 0.00062602398580512088 5 0.96629466620324067 6 0.033079309810954166
		3 0 0.00049129232746730278 1 0.96514003127044345 2 0.034368676402089314
		3 0 0.00070356788203217939 1 0.95879982130593766 2 0.040496610812030313
		3 0 0.0009837719432273372 1 0.93004438616074714 2 0.068971841896025468
		3 0 0.0015338813571939903 1 0.94202371041932975 2 0.056442408223476292
		3 0 0.0024202089171465858 1 0.94732616050393736 2 0.050253630578915909
		3 0 0.0039970975156914746 1 0.95097870506810178 2 0.045024197416206786
		3 0 0.0058666445030247398 1 0.95242304370775765 2 0.041710311789217559
		3 0 0.0086319805397260096 1 0.95859959089982627 2 0.032768428560447677
		3 0 0.0073158494005370819 1 0.95972979447434481 2 0.032954356125118135
		3 0 0.0024611735043112643 1 0.95270953573654138 2 0.044829290759147475
		3 0 0.002312217577963831 1 0.95743336350221009 2 0.040254418919826132
		3 0 0.00089725051595582314 1 0.96262798072221134 2 0.036474768761832782
		3 5 0.00029858601934280784 6 0.88462452788206569 7 0.11507688609859157
		3 5 0.00068172372708494484 6 0.94123426365019869 7 0.058084012622716334
		3 5 0.0014999200533611372 6 0.96963081375828675 7 0.028869266188352064
		3 5 0.0005931333079859123 6 0.98128629208834106 7 0.018120574603673126
		3 5 0.0026239630131097871 6 0.99246736773690569 7 0.0049086692499844637
		3 5 0.001928585686579901 6 0.99061208521923916 7 0.0074593290941809293
		3 5 0.0014523792250538939 6 0.98883794399001967 7 0.0097096767849263934
		3 5 0.0033513146793797887 6 0.99002349996604944 7 0.006625185354570763
		3 5 0.0040551526579506829 6 0.98026626154881025 7 0.015678585793238949
		3 5 0.0033611753053486753 6 0.96879911828401843 7 0.027839706410633068
		3 5 0.0027772407891774806 6 0.95884913227065593 7 0.038373626940166695
		3 5 0.00083983066690731904 6 0.93496687725137129 7 0.064193292081721365
		3 1 0.00089265104763033701 2 0.88708792115861235 3 0.11201942779375731
		3 1 0.0012467077314582023 2 0.94039472236345589 3 0.058358569905085859
		3 1 0.0014488492525169363 2 0.96906925703928071 3 0.029481893708202207
		3 1 0.00063368582645874296 2 0.98125224767944164 3 0.018114066494099537
		3 1 0.0027904396704939789 2 0.99234146731295458 3 0.004868093016551586
		3 1 0.0027358493313389682 2 0.98936941201028583 3 0.0078947386583751965
		3 1 0.0025530938747140163 2 0.99022948507528485 3 0.0072174210500010128
		3 1 0.0033022639415024491 2 0.98765220552714272 3 0.009045530531354774
		3 1 0.0040589010737392284 2 0.978314729019233 3 0.017626369907027734
		3 1 0.0039371641378990845 2 0.96794798046534114 3 0.028114855396759866
		3 1 0.0040480198835415437 2 0.95995491121966281 3 0.035997068896795582
		3 1 0.0017395197202862039 2 0.93807865748371966 3 0.060181822795994017
		3 5 9.0979915430088874e-06 6 0.60298808936929249 7 0.39700281263916465
		3 5 3.0754298103017332e-05 6 0.72065054189663802 7 0.27931870380525908
		3 5 0.00010440687576607837 6 0.79001850704824272 7 0.20987708607599129
		3 5 0.00020681432520893383 6 0.84715863794686286 7 0.1526345477279282
		3 5 0.00029647003797455982 6 0.89620295930909277 7 0.10350057065293265
		3 5 0.00033958177430398452 6 0.94390363418014178 7 0.055756784045554085
		3 5 9.3090050869586651e-05 6 0.96431424234381813 7 0.035592667605312378
		3 5 0.0001487888165438076 6 0.95113031999590014 7 0.048720891187556084
		3 5 0.00017043621392585803 6 0.93425034232069082 7 0.065579221465383364
		3 5 6.0047161822687157e-05 6 0.88024105712131373 7 0.11969889571686358
		3 5 6.4222399068397423e-05 6 0.81426371962813138 7 0.18567205797280026
		3 5 2.7621961198039421e-05 6 0.73192702208918448 7 0.26804535594961754
		3 1 4.3166896082356496e-05 2 0.61012656266881726 3 0.38983027043510038
		3 1 0.00013309767236965894 2 0.73319886373512178 3 0.26666803859250859
		3 1 0.00026591863345004646 2 0.80511122567491289 3 0.19462285569163712
		3 1 0.00031661626086893207 2 0.85463778399778989 3 0.14504559974134112
		3 1 0.00032103173952541123 2 0.89441137457156183 3 0.10526759368891263
		3 1 0.00035078953184710803 2 0.93309636243154692 3 0.066552848036606119
		3 1 0.00033026083172667215 2 0.9653119557200055 3 0.034357783448267898
		3 1 0.00024423026141507975 2 0.94891083279952038 3 0.050844936939064458
		3 1 0.0002165369850179317 2 0.93376696539215864 3 0.066016497622823467
		3 1 5.7338893708540887e-05 2 0.87906514820884629 3 0.12087751289744529
		3 1 9.259099021244857e-05 2 0.81122575144334164 3 0.18868165756644603
		3 1 9.2979921049206852e-05 2 0.7321250652698168 3 0.26778195480913408
		3 0 0.00018690961111501696 5 0.83804974093778473 6 0.1617633494511003
		3 0 0.00013129815163970545 5 0.90383721248310056 6 0.096031489365259834
		3 0 0.00011853096127347115 5 0.86799486296909723 6 0.13188660606962946
		3 0 0.00011973110155292146 5 0.81961928044139332 6 0.18026098845705374
		3 0 0.00026614926104376438 5 0.79724503502095956 6 0.20248881571799665
		3 0 0.00054984398738609742 5 0.82397864215695027 6 0.17547151385566356
		3 0 0.00085778082908413765 5 0.8475130837981999 6 0.15162913537271597
		3 0 0.0013246807440228611 5 0.87705344916243599 6 0.1216218700935412
		3 0 0.0019234014704892298 5 0.90638719269379309 6 0.091689405835717649
		3 0 0.0018289502119637241 5 0.90478050853400049 6 0.093390541254035689
		3 0 0.00078595924191673277 5 0.87563253197885871 6 0.12358150877922469
		3 0 0.00033398721627518862 5 0.84611832012545252 6 0.15354769265827248
		3 0 0.00033367467812699152 1 0.82138883390715489 2 0.1782774914147181
		3 0 0.0002133962229725476 1 0.90048321594806358 2 0.099303387828963918
		3 0 0.00013150866649960568 1 0.87854097504420126 2 0.12132751628929905
		3 0 0.0001335050982193196 1 0.84502575148050729 2 0.15484074342127335
		3 0 0.00010860366945911839 1 0.7673687922274024 2 0.23252260410313846
		3 0 0.00027330046295727167 1 0.81515079832335047 2 0.18457590121369227
		3 0 0.00048995440748737166 1 0.85062492018629776 2 0.14888512540621485
		3 0 0.00082526163434516265 1 0.88337870139782515 2 0.11579603696782967
		3 0 0.0014902014341887028 1 0.90949066102496001 2 0.089019137540851334
		3 0 0.0021026840292740438 1 0.90394033811190566 2 0.093956977858820317
		3 0 0.0012005487233493178 1 0.87214256558345937 2 0.12665688569319125
		3 0 0.00058032317653637926 1 0.83290483686175587 2 0.16651483996170779
		3 5 0.0042000814283956016 6 0.98306921990582585 7 0.01273069866577848
		3 5 0.0067940954533851948 6 0.98902595079342748 7 0.0041799537531872662
		3 5 0.016365891696193027 6 0.98234652935070499 7 0.0012875789531021772
		3 5 0.007203245600585266 6 0.99099337268833276 7 0.0018033817110818787
		3 5 0.020501524727752626 6 0.97940751738075504 7 9.0957891492247052e-05
		3 5 0.0087983724145239209 6 0.9909765066456433 7 0.00022512093983266881
		3 5 0.012366249696544521 6 0.9870451445451055 7 0.00058860575834989717
		3 5 0.017232965061463375 6 0.98178259760079745 7 0.00098443733773902111
		3 5 0.026967215189122699 6 0.97120734554561539 7 0.0018254392652618614
		3 5 0.014496068778916219 6 0.98161519578081735 7 0.0038887354402663363
		3 5 0.02430636341342577 6 0.97360988801814896 7 0.0020837485684252781
		3 5 0.008575183083936554 6 0.98613146260728479 7 0.0052933543087787379
		3 1 0.008817772910191481 2 0.98034088716646917 3 0.010841339923339353
		3 1 0.0076509967477016343 2 0.98815861516806469 3 0.0041903880842335964
		3 1 0.013287807206370629 2 0.98541247005393728 3 0.0012997227396919912
		3 1 0.006558152719998496 2 0.991662821677051 3 0.0017790256029503926
		3 1 0.019633982782510377 2 0.98028716113152214 3 7.88560859674994e-05
		3 1 0.010157914519649569 2 0.98957528928506788 3 0.00026679619528249306
		3 1 0.018543384886435834 2 0.98084672340755086 3 0.00060989170601328678
		3 1 0.014139143216658176 2 0.98441192542658917 3 0.0014489313567525304
		3 1 0.029589747720133903 2 0.96830330517636776 3 0.002106947103498482
		3 1 0.017273146966588503 2 0.97877030827626177 3 0.0039565447571496834
		3 1 0.031091415501294628 2 0.96690219175855585 3 0.0020063927401495858
		3 1 0.010181863487378817 2 0.98414929273412566 3 0.0056688437784954606
		3 10 0.14827689081287776 11 0.33870618687706722 12 0.51301692231005502
		3 10 0.19069089398445502 11 0.38306215053908821 12 0.42624695547645669
		3 10 0.1492026990031772 11 0.33031058734211249 12 0.52048671365471033
		3 10 0.088508985932110804 11 0.4662066611782652 12 0.44528435288962404
		3 10 0.11557217461136049 11 0.57203917595958909 12 0.31238864942905042
		3 10 0.087259890041620852 11 0.45915797213166948 12 0.45358213782670964
		3 11 0.29036250911689215 12 0.55374710334178256 13 0.15589038754132536
		3 10 0.089475620877559503 11 0.34250238667601057 12 0.56802199244643004
		3 10 0.087405451226181832 11 0.3292069037898771 12 0.58338764498394124
		3 11 0.27239600406187708 12 0.57545332846204966 38 0.15215066747607325
		3 11 0.30846357304397126 12 0.56294736664700307 13 0.12858906030902581
		3 11 0.28896216997099244 12 0.58647360855854147 38 0.12456422147046604
		3 12 0.40308290280214587 13 0.48204715572835188 14 0.11486994146950229
		3 12 0.5066239729743911 13 0.31151088858483506 36 0.18186513844077376
		3 12 0.42940804494844698 13 0.41443389840411732 14 0.15615805664743559
		3 12 0.22599669149824606 13 0.49369198196162667 14 0.28031132654012725
		3 12 0.23678922706767519 38 0.44853537481722838 39 0.31467539811509626
		3 12 0.44479347541592601 38 0.37991650839046998 39 0.17529001619360401
		3 12 0.53496816340031528 36 0.17094872233633712 38 0.29408311426334771
		3 12 0.42201342909045364 38 0.46037533796639091 39 0.11761123294315538
		3 12 0.29132701005509276 13 0.52201589482578359 14 0.18665709511912354
		1 12 0.46622537888182514;
	setAttr ".wl[333:499].w"
		2 13 0.44593526765840535 14 0.087839353459769592
		3 12 0.29939090265580875 38 0.48146587553507009 39 0.21914322180912135
		3 12 0.48917731793950936 38 0.4086542898332392 39 0.10216839222725137
		3 11 0.1370222913002033 12 0.66451436095404215 13 0.19846334774575469
		3 12 0.37102112252637354 13 0.31778756804251534 14 0.31119130943111106
		3 12 0.27892258198235825 13 0.40542964271694693 14 0.31564777530069488
		3 12 0.5128334834732764 13 0.31959581524667896 14 0.16757070128004481
		3 12 0.52594307174176291 38 0.29456533356391462 39 0.17949159469432238
		3 12 0.29235935620855941 38 0.3675227124115743 39 0.3401179313798664
		3 12 0.36006470838074528 38 0.29641897799479555 39 0.34351631362445928
		3 12 0.66232822841209849 38 0.18846246793559296 39 0.14920930365230861
		3 12 0.52554847859450804 13 0.27854666818415508 14 0.19590485322133677
		3 12 0.25365816267399394 13 0.36573613334483995 14 0.38060570398116622
		3 12 0.53080599912803439 38 0.25645278364309443 39 0.21274121722887118
		3 12 0.25733869534112391 38 0.3312318616859582 39 0.41142944297291789
		3 12 0.30240927703284975 13 0.36430209682849685 14 0.33328862613865345
		3 12 0.62440966058366743 13 0.24270722869731776 14 0.13288311071901479
		3 12 0.61266927223970491 13 0.2625824804760285 36 0.12474824728426674
		3 12 0.43021213150592724 13 0.4256656199847037 14 0.14412224850936906
		3 12 0.42973564945362014 38 0.42381270571065777 39 0.14645164483572212
		3 12 0.61967838024680777 36 0.12422978415010118 38 0.25609183560309112
		3 12 0.61396400192352607 38 0.23047628477278639 39 0.15555971330368748
		3 12 0.28650745081200518 38 0.34973552642616168 39 0.36375702276183325
		3 12 0.40214891469632058 13 0.38505725848558742 14 0.21279382681809195
		3 12 0.66132261622785526 13 0.2590402739915581 14 0.079637109780586801
		3 12 0.39261410372381855 38 0.37140342000593307 39 0.23598247627024849
		3 12 0.6593455154990604 38 0.24890831558459414 39 0.09174616891634528
		3 12 0.43527393984698087 13 0.42613997089934952 14 0.13858608925366969
		3 12 0.5021911709900051 13 0.2272827080975301 36 0.27052612091246503
		3 12 0.4937494327347452 13 0.19651428724094747 36 0.30973628002430731
		3 12 0.44562687939726681 13 0.37347388488622663 36 0.18089923571650668
		3 12 0.47727074361334226 36 0.16081522894881317 38 0.36191402743784445
		3 12 0.5158015734675151 36 0.29251635688849353 38 0.1916820696439912
		3 12 0.52405207752696403 36 0.2583777871381378 38 0.21757013533489822
		3 12 0.44902934434725217 38 0.42024225585299652 39 0.1307283997997512
		3 12 0.42569299023644536 13 0.39864642242445791 36 0.17566058733909673
		3 12 0.46302169102270263 13 0.17917691935046395 36 0.35780138962683333
		3 12 0.45513057080211028 36 0.1568904446561174 38 0.38797898454177226
		3 12 0.4889781809106386 36 0.33997182874913606 38 0.17104999034022528
		3 12 0.0016063237506273541 13 0.10671016196717698 14 0.89168351428219561
		3 12 0.00039181972149654487 13 0.029649053856476516 14 0.96995912642202686
		3 12 0.00048090694224920435 13 0.027551780111001716 14 0.9719673129467491
		3 12 0.0018959783801619789 13 0.10108223253774812 14 0.89702178908208996
		3 12 0.0018846199024068373 38 0.091174351219780556 39 0.90694102887781258
		3 12 0.00044927517830719525 38 0.026239507032291637 39 0.97331121778940122
		3 12 0.00035265332072484683 38 0.025153964573352887 39 0.97449338210592218
		3 12 0.0016333867772952977 38 0.092866922924882675 39 0.90549969029782207
		3 12 0.0010907516196620038 13 0.065428576626783586 14 0.93348067175355431
		3 12 0.00023456925115790286 13 0.014629667007426933 14 0.98513576374141509
		3 12 0.0010385876564477162 38 0.056994822431199542 39 0.9419665899123526
		3 12 0.00021358472776564032 38 0.01357049748837277 39 0.98621591778386164
		3 12 0.018369132241208466 13 0.19565107740004117 14 0.78597979035875021
		3 12 0.046530467216426091 13 0.3536793988514581 14 0.59979013393211578
		3 12 0.0028724724894646711 13 0.14663492853515295 14 0.85049259897538243
		3 12 0.00087538691139046627 13 0.049411018895492598 14 0.94971359419311685
		3 12 0.00090088384966687028 38 0.048411257300968395 39 0.9506878588493648
		3 12 0.0030619086701720827 38 0.14052633744887399 39 0.85641175388095403
		3 12 0.040859477976047637 38 0.36108638134980281 39 0.59805414067414953
		3 12 0.01593375689038774 38 0.20421421213569665 39 0.77985203097391553
		3 12 0.036597715938133019 13 0.40108481883662128 14 0.56231746522524551
		3 12 0.020070701624893394 13 0.23613164741502907 14 0.74379765096007755
		3 12 0.0005009452304241814 13 0.048560834374119961 14 0.95093822039545595
		3 12 0.0019105754262055945 13 0.14959466012442721 14 0.84849476444936722
		3 12 0.0019749188392249057 38 0.14232575007515438 39 0.85569933108562057
		3 12 0.00048596523089738421 38 0.043336843008255715 39 0.95617719176084692
		3 12 0.021703215901336403 38 0.21323972809151179 39 0.76505705600715179
		3 12 0.036164318188123851 38 0.37422552404467097 39 0.58961015776720516
		3 12 0.0061336877996516839 13 0.24270068148182539 14 0.75116563071852294
		3 12 0.0016286933130258165 13 0.096269151921402021 14 0.90210215476557198
		3 12 0.0059407114731481131 38 0.23598191241648814 39 0.75807737611036374
		3 12 0.0017445666443560682 38 0.090480083778954737 39 0.90777534957668915
		3 12 0.0025755818083537554 13 0.096744713561153398 14 0.90067970463049285
		3 12 0.0090926844015055911 13 0.23344453820868491 14 0.75746277738980961
		3 12 0.0025571795861898316 38 0.10057380893355287 39 0.89686901148025722
		3 12 0.0084404482164239132 38 0.23785797435434475 39 0.75370157742923138
		3 13 8.7932074193793944e-07 14 0.60128368783427122 15 0.39871543284498695
		3 13 6.2437911808058551e-07 14 0.60246977154989645 15 0.39752960407098537
		3 14 0.23545499505395831 15 0.76454474973096842 16 2.5521507321634338e-07
		3 14 0.26404506294536212 15 0.73595468713210743 16 2.4992253044463642e-07
		3 39 0.23638524562975341 40 0.76361442026996218 41 3.3410028435346725e-07
		3 39 0.22118566091235106 40 0.77881402803976552 41 3.1104788334096413e-07
		3 38 8.2532620043628605e-07 39 0.58315875416025398 40 0.41684042051354564
		3 38 1.2765188006305919e-06 39 0.57811967975193801 40 0.42187904372926133
		3 13 5.978416095150626e-07 14 0.53785885709470216 15 0.46214054506368846
		3 14 0.3113249484675239 15 0.68867487868229282 16 1.7285018318075804e-07
		3 38 8.8462347603670141e-07 39 0.51094738759084357 40 0.48905172778568029
		3 39 0.28693620301557499 40 0.7130635707733799 41 2.2621104503973073e-07
		3 14 0.22009693204869468 15 0.77990288215718717 16 1.8579411808661257e-07
		3 13 2.2458773987992806e-07 14 0.50632690741553354 15 0.49367286799672655
		3 13 1.5451501275243393e-06 14 0.57156434542765866 15 0.42843410942221377
		3 14 0.30517122867612978 15 0.69482791909275532 16 8.5223111500680853e-07
		3 39 0.28998960752820918 40 0.7100096119213386 41 7.8055045218522708e-07
		3 38 1.409397383100061e-06 39 0.54466889707279265 40 0.45532969352982422
		3 38 2.4910164548232307e-07 39 0.48020446924599786 40 0.51979528165235678
		3 39 0.20854814590615722 40 0.79145165383831129 41 2.0025553147764567e-07
		3 14 0.31066777473259949 15 0.68933200287650664 16 2.2239089394969491e-07
		3 13 2.8814050435347163e-07 14 0.50966996257360353 15 0.49032974928589212
		3 39 0.29263740561521356 40 0.70736237339540164 41 2.2098938479669196e-07
		3 38 2.7292562670293185e-07 39 0.47727467202765006 40 0.52272505504672317
		3 14 0.30308127471986102 15 0.69691508952785131 16 3.6357522875322965e-06
		3 13 1.1067961097358261e-05 14 0.64426888606186239 15 0.35572004597704021
		3 13 3.7613799407774011e-06 14 0.58516678635581942 15 0.41482945226423973
		3 14 0.28138404787574922 15 0.71861289556111441 16 3.0565631363347442e-06
		3 39 0.27447911794494262 40 0.72551693077121193 41 3.951283845651666e-06
		3 38 3.3505556241951667e-06 39 0.55902728901688736 40 0.44096936042748847
		3 38 9.5889189794647425e-06 39 0.62714417449347604 40 0.37284623658754451
		3 39 0.28943534560578621 40 0.71056104563226963 41 3.6087619440451876e-06
		3 14 0.40237289389308167 15 0.59762393717807016 16 3.1689288482799396e-06
		3 13 1.147927117540643e-05 14 0.65961563494572917 15 0.34037288578309544
		3 39 0.38662771490467734 40 0.61336901182356418 41 3.2732717586205608e-06
		3 38 9.9165421771747834e-06 39 0.64012920446594435 40 0.35986087899187869
		3 14 0.27864972913326108 15 0.72134954430020692 16 7.2656653203891216e-07
		3 13 1.0940532560655376e-06 14 0.52832806963383538 15 0.47167083631290863
		3 13 5.4153997593767763e-07 14 0.53739072883060224 15 0.46260872962942179
		3 13 1.629947280045504e-07 14 0.29607146171491106 15 0.70392837529036101
		3 38 2.292028493685992e-07 39 0.27388574418135714 40 0.72611402661579338
		3 38 7.395455216863593e-07 39 0.51036944822998276 40 0.48962981222449553
		3 38 1.1902026830824129e-06 39 0.50033260119126421 40 0.49966620860605265
		3 39 0.27329045587520834 40 0.72670839226081396 41 1.1518639776495087e-06
		3 13 2.5969228688110416e-07 14 0.30868352398495208 15 0.69131621632276108
		3 13 6.3153042234853896e-07 14 0.47787554990963982 15 0.52212381855993784
		3 38 3.3082295003029816e-07 39 0.29508098075631389 40 0.70491868842073613
		3 38 7.9377017085950871e-07 39 0.45198966324538198 40 0.54800954298444715
		3 13 1.3140477288486257e-05 14 0.91445045296781136 15 0.085536406554900135
		3 13 8.206789051729471e-05 14 0.95572955824704653 15 0.044188373862436146
		3 13 1.4762004954096024e-05 14 0.95651787732046945 15 0.043467360674576315
		3 13 3.1371687392954421e-06 14 0.90862770200139853 15 0.091369160829862031
		3 38 3.8909686086490358e-06 39 0.90588289721416082 40 0.094113211817230605
		3 38 1.5801918023285957e-05 39 0.95567328799481543 40 0.044310910087161114
		3 38 7.285481238026922e-05 39 0.94982715632454151 40 0.05009998886307819
		3 38 1.1576132283185976e-05 39 0.89931078195154512 40 0.10067764191617168
		3 14 0.020858941625817657 15 0.9791277011782783 16 1.3357195904072992e-05
		3 14 0.042006441447838119 15 0.95799115950730185 16 2.3990448601077853e-06
		3 14 0.035302641569101997 15 0.96469640684776425 16 9.5158313378500847e-07
		3 14 0.01520944271167644 15 0.9847860068492521 16 4.5504390714577439e-06
		3 39 0.010047037399317081 40 0.9899457479249486 41 7.214675734291403e-06
		3 39 0.025430706255148264 40 0.9745677201496723 41 1.5735951795711757e-06
		3 39 0.045292954952274173 40 0.95470236114556417 41 4.6839021616395233e-06
		3 39 0.02148224532033725 40 0.97849921134550999 41 1.8543334152728177e-05
		3 13 5.9120928150016238e-05 14 0.97341517865285132 15 0.026525700418998665
		3 13 1.3878513591684431e-05 14 0.93679651617802973 15 0.063189605308378596
		3 13 2.4380667564056171e-06 14 0.94202805942038237 15 0.057969502512861308
		3 13 1.2478422785383024e-05 14 0.97648374846785913 15 0.023503773109355534
		3 38 1.230121956903793e-05 39 0.97543845923747718 40 0.024549239542953846
		3 38 2.4464293961180339e-06 39 0.93766717974202074 40 0.062330373828583092
		3 38 1.2079894800241619e-05 39 0.93200662818647106 40 0.067981291918728731
		3 38 5.186352715940356e-05 39 0.97209744897260542 40 0.027850687500235186
		3 14 0.041783443399680882 15 0.95821079999281211 16 5.7566075069699162e-06
		3 14 0.019850286884169482 15 0.98012877735878978 16 2.093575704071937e-05
		3 14 0.0078082337296789157 15 0.99218714950575237 16 4.6167645687850977e-06
		3 14 0.018967600765569161 15 0.9810311298016241 16 1.2694328068241528e-06
		3 39 0.019612929123151039 40 0.98038588877526267 41 1.1821015862752882e-06
		3 39 0.0078019528753994075 40 0.9921928764502137 41 5.1706743868266046e-06
		3 39 0.01960547443314159 40 0.98037293663959946 41 2.158892725892219e-05
		3 39 0.042235402197538276 40 0.95775889860377117 41 5.6991986905300255e-06
		3 13 4.3107915265819859e-05 14 0.98903160118791555 15 0.010925290896818622
		3 13 7.2830986334771525e-06 14 0.93211308600594134 15 0.067879630895425189
		3 38 3.9462722772158756e-05 39 0.98830557261212681 40 0.011654964665101028
		3 38 6.7355300157890742e-06 39 0.9245717129639498 40 0.075421551506034509
		3 14 0.032866945422094389 15 0.96712939589908964 16 3.6586788159808215e-06
		3 14 0.0061136237226702373 15 0.99386439976273377 16 2.1976514595993338e-05
		3 39 0.034523805699928016 40 0.96547272381411731 41 3.4704859546402554e-06
		3 39 0.006138553257320759 40 0.99383712624250409 41 2.4320500175194618e-05
		3 14 0.0080741521046263521 15 0.99190963176671587 16 1.6216128657952614e-05
		3 14 0.03999912661634903 15 0.9599991084559456 16 1.7649277054271658e-06
		3 39 0.0066197660846960826 40 0.99335858707180436 41 2.1646843499655488e-05
		3 39 0.037621574741169526 40 0.96237524925590034 41 3.1760029301153197e-06;
	setAttr ".wl[500:666].w"
		3 13 5.3467570708069892e-06 14 0.8914978646851236 15 0.10849678855780555
		3 13 5.5346862258260718e-05 14 0.97194440830808304 15 0.028000244829658714
		3 38 5.4527756009830445e-06 39 0.87683282616038427 40 0.12316172106401477
		3 38 5.0720162639044467e-05 39 0.96847270345028791 40 0.03147657638707313
		3 12 0.18431269910996897 13 0.50565440683134089 14 0.31003289405869011
		3 12 0.15440873436805699 13 0.48843282929497295 14 0.35715843633696998
		3 12 0.12601887910371651 38 0.49461898061963455 39 0.37936214027664905
		3 12 0.1514105276716125 38 0.50412337635681626 39 0.34446609597157118
		3 12 0.13298170422942862 13 0.48700140808145032 14 0.38001688768912117
		3 12 0.17813157446456049 38 0.51632148884004825 39 0.30554693669539129
		3 12 0.021695564699179687 13 0.37099921250418944 14 0.60730522279663079
		3 12 0.019618305161756736 13 0.35032473069755987 14 0.63005696414068335
		3 12 0.016220743617828444 38 0.31820185682894481 39 0.6655773995532267
		3 12 0.020123499311507129 38 0.33138481506536871 39 0.6484916856231242
		3 12 0.016532735479245653 13 0.34536195097239603 14 0.6381053135483582
		3 12 0.020715081594861746 38 0.37810255066304849 39 0.60118236774208988
		3 15 0.51886135674841938 16 0.4808670406259124 17 0.00027160262566834197
		3 15 0.62922539908684338 16 0.37000793770114965 17 0.00076666321200698716
		3 40 0.59993401353934195 41 0.39949676098220765 42 0.00056922547845047208
		3 40 0.54280644527161037 41 0.45695858539452106 42 0.00023496933386850442
		3 15 0.59850755456541571 16 0.40103820403359669 17 0.00045424140098753861
		3 40 0.60013842801887374 41 0.39947990210708789 42 0.00038166987403838237
		3 11 0.083617313486529454 12 0.60679296834782248 13 0.30958971816564818
		3 12 0.60936637587390274 13 0.33016652272501879 38 0.060467101401078471
		3 12 0.67078644642691543 13 0.17901815597811305 38 0.1501953975949715
		3 12 0.66200358544942228 13 0.17983793978604326 38 0.15815847476453448
		3 12 0.63630870955645868 13 0.072059389457456186 38 0.29163190098608516
		3 11 0.08291801294223676 12 0.630133205499252 38 0.28694878155851122
		3 11 0.22181590879132113 12 0.6602044082752625 13 0.11797968293341643
		3 11 0.17572109118338508 12 0.59294364768643582 13 0.23133526113017908
		3 11 0.16663675502270756 12 0.61191615834316204 38 0.22144708663413037
		3 11 0.080892889326660111 12 0.88287756837440734 38 0.036229542298932445
		3 12 0.88988085151947371 13 0.05412828686206643 38 0.055990861618459863
		3 11 0.024489922318578567 12 0.83907267732916369 13 0.13643740035225757
		3 11 0.095749224940759492 12 0.80385919583825194 13 0.10039157922098846
		3 11 0.024359837816493674 12 0.84137110681180494 38 0.13426905537170145
		3 11 0.094943455427272269 12 0.80693653569494983 38 0.098120008877777984
		3 11 0.22494914554230774 12 0.69857711621501917 13 0.076473738242673159
		3 10 0.025430101479781052 11 0.2922107356587863 12 0.68235916286143272
		3 11 0.22005141650818191 12 0.70529786042177889 38 0.074650723070039143
		3 12 0.26478203940612166 36 0.67011379736175836 37 0.065104163232119885
		3 12 0.12621568779691206 36 0.69730870301084447 37 0.17647560919224362
		3 12 0.15473427284458555 36 0.66336644480215134 37 0.18189928235326325
		3 12 0.30090611124385042 36 0.62563365622727229 37 0.073460232528877192
		3 12 0.30319171497973813 36 0.61325757925747326 37 0.083550705762788627
		3 12 0.16290190470354748 36 0.64393129403556948 37 0.19316680126088306
		3 12 0.13296332783503456 36 0.67367108327287295 37 0.1933655888920926
		3 12 0.27698893015744253 36 0.65151599114771164 37 0.071495078694845712
		3 12 0.28465659523123443 36 0.64258406435248261 37 0.072759340416282986
		3 12 0.1417177187944432 36 0.67409336622938709 37 0.18418891497616968
		3 12 0.28759883155884414 36 0.62717758664936574 37 0.085223581791790098
		3 12 0.14436740392749073 36 0.64885852200974348 37 0.20677407406276588
		3 12 0.30050813138205923 36 0.62351797057904323 37 0.075973898038897633
		3 12 0.15862015608160618 36 0.6597563574393337 37 0.18162348647906021
		3 12 0.13173247204552069 36 0.65219909563264333 37 0.21606843232183587
		3 12 0.26117279499405804 36 0.63953180352638772 37 0.09929540147955411
		3 12 0.16828999933089134 36 0.65164374749619336 37 0.18006625317291539
		3 12 0.30737967031485525 36 0.61548865678831965 37 0.077131672896825251
		3 12 0.11144045831294429 36 0.72914050870560321 37 0.15941903298145255
		3 12 0.25877891428167032 36 0.69374137387052304 37 0.047479711847806756
		3 12 0.31388767139703089 36 0.66111307799716379 37 0.02499925060580533
		3 12 0.14056343315149636 36 0.74690333379545504 37 0.11253323305304852
		3 12 0.26738063488942326 36 0.68405588215499435 37 0.048563482955582271
		3 12 0.11953218123033096 36 0.71663253488154177 37 0.16383528388812738
		3 12 0.44692083614987127 13 0.061148280530372828 36 0.49193088331975593
		3 12 0.40704838649063757 13 0.046359995995425056 36 0.54659161751393737
		3 12 0.42201686556209123 36 0.53698010641268434 38 0.041003028025224431
		3 12 0.45601767010446259 36 0.48461383930163265 38 0.059368490593904838
		3 12 0.430187252186156 13 0.064808954746024675 36 0.50500379306781917
		3 12 0.44822287477683803 36 0.49322650174260896 38 0.058550623480553038
		3 12 0.071689396463917893 13 0.46315836357771467 14 0.46515223995836757
		3 12 0.062212809823163039 13 0.44559518946526833 14 0.49219200071156866
		3 12 0.050276566340694558 13 0.44122047258951436 14 0.50850296106979098
		3 12 0.064313241080354383 38 0.48478623336896898 39 0.45090052555067645
		3 12 0.060001282182146787 38 0.4523870215676713 39 0.48761169625018186
		3 12 0.047320077685904419 38 0.43030661952132526 39 0.52237330279277028
		3 12 0.10588685385686493 13 0.48211556960370305 14 0.41199757653943203
		3 12 0.09559046390321202 38 0.48311790100551183 39 0.4212916350912761
		3 12 0.03562275801071995 13 0.42648633496471261 14 0.53789090702456754
		3 12 0.031644155251241014 38 0.4164031603021236 39 0.55195268444663526
		3 12 0.013096662420333268 13 0.34461833083701948 14 0.64228500674264721
		3 12 0.012356108290549988 38 0.32580230195987292 39 0.66184158974957696
		3 12 0.043752999359916653 13 0.46430885672414607 14 0.49193814391593721
		3 12 0.12013149144661722 13 0.51837943358104199 14 0.3614890749723409
		3 12 0.10544308188895722 38 0.52170159010285722 39 0.3728553280081856
		3 12 0.035210938282765197 38 0.47875955097303041 39 0.48602951074420436
		3 12 0.020664550667454398 13 0.397870863638637 14 0.58146458569390869
		3 12 0.017449674701548814 38 0.41947665329234202 39 0.56307367200610914
		3 12 0.031131106631655466 13 0.16901042486141676 14 0.79985846850692777
		3 12 0.02651469237676277 13 0.15571975513943773 14 0.81776555248379945
		3 12 0.02273140247638487 38 0.15678100147410559 39 0.82048759604950949
		3 12 0.027788813508867406 38 0.15693132432995563 39 0.81527986216117676
		3 12 0.024947758107042219 13 0.18440590758568062 14 0.79064633430727704
		3 12 0.025080240819358633 38 0.16175201092556205 39 0.81316774825507931
		3 13 4.1516961115378689e-06 14 0.77805497592256068 15 0.22194087238132779
		3 13 3.5686157449068794e-05 14 0.84071528767781623 15 0.15924902616473482
		3 38 3.1266186304219666e-05 39 0.82329695298909567 40 0.17667178082460011
		3 38 3.82525885829961e-06 39 0.74701585822975669 40 0.25298031651138497
		3 39 0.1176734888097189 40 0.88232344633915094 41 3.0648511300638608e-06
		3 39 0.082818888320158573 40 0.91716874471631293 41 1.2366963528479639e-05
		3 14 0.079660985370094736 15 0.9203301256447608 16 8.8889851443203854e-06
		3 14 0.112977339660427 15 0.8870210456364932 16 1.6147030798853072e-06
		3 13 5.2266418332340781e-06 14 0.87443240008482392 15 0.12556237327334291
		3 13 1.4219453670239181e-06 14 0.78607894123040101 15 0.21391963682423204
		3 38 1.8596898839331061e-06 39 0.76953299754014304 40 0.23046514276997304
		3 38 6.4193467996067853e-06 39 0.87002200703870269 40 0.12997157361449763
		3 39 0.048669111527073233 40 0.9513286897746388 41 2.198698287994753e-06
		3 39 0.092111733168164844 40 0.90788760597573137 41 6.6085610372519689e-07
		3 14 0.10811024502842939 15 0.89188932982929159 16 4.2514227892932549e-07
		3 14 0.063791226472407897 15 0.93620734414339069 16 1.4293842013589552e-06
		3 39 0.14135058845457771 40 0.85864853356922521 41 8.7797619698139349e-07
		3 14 0.14554158557979124 15 0.85445797080323549 16 4.4361697328996514e-07
		3 38 1.5399747610629436e-06 39 0.67176188863050068 40 0.32823657139473816
		3 13 1.3129255197427311e-06 14 0.70413449986282306 15 0.29586418721165714
		3 38 3.8653239986330302e-06 39 0.88675171537722408 40 0.11324441929877735
		3 38 1.0362475197346961e-06 39 0.79659416922542703 40 0.20340479452705329
		3 13 9.9757831217342754e-07 14 0.81250393540170796 15 0.18749506701997992
		3 13 3.6114778584766924e-06 14 0.89254766054503787 15 0.1074487279771036
		3 14 0.040767928537982875 15 0.95923036958014984 16 1.7018818671056921e-06
		3 14 0.076767998868093754 15 0.92323139184739478 16 6.0928451157800699e-07
		3 39 0.075584236781698469 40 0.92441517776824011 41 5.8545006149321495e-07
		3 39 0.037684666375233399 40 0.96231312442633077 41 2.209198435647853e-06
		3 14 0.11993220676504682 15 0.88006499923508286 16 2.7939998702213013e-06
		3 14 0.083586593288686117 15 0.91639989245081632 16 1.3514260497532622e-05
		3 39 0.080438372477825829 40 0.91954761091814385 41 1.4016604030286774e-05
		3 39 0.11819131113129513 40 0.88180597727393062 41 2.7115947742210962e-06
		3 38 6.6606089326871784e-06 39 0.8053978986697734 40 0.19459544072129403
		3 38 6.4066555681852941e-05 39 0.89581259725976647 40 0.10412333618455177
		3 13 7.2798807140234982e-05 14 0.90095966084501466 15 0.098967540347845162
		3 13 7.5862838103432085e-06 14 0.8214173155278921 15 0.1785750981882975
		3 39 0.13434108504672446 40 0.86565822918486113 41 6.8576841448080962e-07
		3 14 0.13597006525889641 15 0.86402920504693126 16 7.2969417226124932e-07
		3 38 1.2090570083243396e-06 39 0.71401100101451631 40 0.28598778992847529
		3 13 1.2733047454874803e-06 14 0.74126536413222599 15 0.25873336256302859
		3 15 0.66357005473393826 16 0.33560072838763544 17 0.00082921687842622935
		3 15 0.69220146101371849 16 0.30710305254220577 17 0.00069548644407582379
		3 40 0.68149411430573692 41 0.31772590996343986 42 0.00077997573082323691
		3 40 0.66310677824519682 41 0.33537700375053292 42 0.0015162180042702427
		3 15 0.77907289796523926 16 0.22062415465763491 17 0.00030294737712573101
		3 40 0.76462438182834769 41 0.23487543997337137 42 0.00050017819828107938
		3 12 0.42975600879517406 13 0.022528895082873493 36 0.54771509612195246
		3 12 0.52903531040573926 13 0.015185627335052064 36 0.45577906225920856
		3 12 0.43558116551286036 36 0.54428540068707765 38 0.020133433800062002
		3 12 0.42267271887788516 36 0.54713954783859708 37 0.030187733283517929
		3 12 0.4603953155791044 13 0.023430189297688992 36 0.51617449512320668
		3 12 0.46582277267453781 36 0.51121317753851903 38 0.022964049786943216
		3 12 0.26459713322485662 38 0.49219826357868995 39 0.24320460319645354
		3 12 0.23263814008712816 38 0.48836526082625015 39 0.27899659908662156
		3 12 0.15736285733346897 38 0.42321655414869841 39 0.41942058851783259
		3 12 0.087869503769961652 38 0.32656900004870476 39 0.58556149618133368
		3 12 0.12371913764987416 38 0.28666836635408927 39 0.5896124959960366
		3 12 0.11657659059052337 38 0.2776883710865351 39 0.60573503832294129
		3 12 0.10473962611732736 38 0.30540441403517071 39 0.58985595984750205
		3 12 0.10609210878134349 38 0.38623442829976845 39 0.50767346291888804
		3 12 0.13025410561909151 38 0.47982036940913086 39 0.38992552497177768
		3 12 0.24469372766666331 38 0.5207804299729627 39 0.23452584236037405
		3 12 0.33510685135665907 38 0.48471602066847891 39 0.18017712797486191
		3 12 0.29505512355056912 38 0.48750934513876426 39 0.21743553131066651
		3 12 0.26570989987968302 13 0.48467058222736481 14 0.24961951789295209
		3 12 0.24322384028771371 13 0.48350889882215681 14 0.27326726089012943
		3 12 0.16932439784930653 13 0.42842190363250682 14 0.40225369851818665
		3 12 0.098362022282590375 13 0.32790322344645967 14 0.57373475427094989
		3 12 0.13565894497741579 13 0.30048158217679005 14 0.5638594728457943
		3 12 0.12086224630797064 13 0.30698342381136945 14 0.57215432988065984
		3 12 0.09943918240696055 13 0.34327083698281746 14 0.55728998061022195
		3 12 0.099627000469687935 13 0.42804610652938097 14 0.47232689300093106
		2 12 0.12971928996454327 13 0.52161954081188333;
	setAttr ".wl[666:833].w"
		1 14 0.34866116922357332
		3 12 0.2501479419319424 13 0.52830430313572108 14 0.22154775493233658
		3 12 0.32140057094558516 13 0.49176122834463887 14 0.18683820070977608
		3 12 0.28448922619338229 13 0.48481223092785353 14 0.23069854287876429
		3 38 6.8545729314117348e-06 39 0.82315172011303017 40 0.17684142531403857
		3 13 5.9282726331906694e-06 14 0.83309781043007947 15 0.16689626129728716
		3 38 7.2691138177298013e-05 39 0.83876634290868934 40 0.16116096595313339
		3 13 8.2053418287253056e-05 14 0.8476279096300654 15 0.15229003695164742
		3 39 0.12628337396529277 40 0.87369633459427543 41 2.0291440431857261e-05
		3 14 0.12989817950672083 15 0.87008400261942809 16 1.7817873850944722e-05
		3 39 0.085391459134217876 40 0.91460659339172956 41 1.9474740526587154e-06
		3 14 0.099349427831539827 15 0.90064921080827054 16 1.3613601895315046e-06
		3 38 0.00032309178452621939 39 0.99381330366164522 40 0.0058636045538285574
		3 38 0.00075754606877664985 39 0.99597894148841837 40 0.0032635124428049525
		3 38 0.0014636908790108204 39 0.99715265178653145 40 0.001383657334457826
		3 38 0.0032782541652343509 39 0.99555628918467354 40 0.0011654566500921809
		3 38 0.0093628557852492404 39 0.98946481971642386 40 0.0011723244983268847
		3 38 0.0082619544269803766 39 0.98538426878116003 40 0.0063537767918595226
		3 38 0.0079341317512219255 39 0.9873305999402876 40 0.0047352683084904207
		3 38 0.0082584580747407897 39 0.98971553394560197 40 0.0020260079796572419
		3 38 0.0085987421832525238 39 0.9908886454559187 40 0.00051261236082877372
		3 38 0.0016886735087072878 39 0.99768218791531171 40 0.00062913857598104303
		3 38 0.00096875376180507176 39 0.99844931790356006 40 0.00058192833463496059
		3 38 0.00065613401739789069 39 0.99722842988501725 40 0.0021154360975847311
		3 13 0.00030604925600384591 14 0.99432964220148301 15 0.0053643085425131281
		3 13 0.00070676770395144224 14 0.99631811384813751 15 0.0029751184479110977
		3 13 0.0013593329496574978 14 0.997416041104907 15 0.0012246259454355333
		3 13 0.0028827811842493225 14 0.99601837109938685 15 0.001098847716363964
		3 13 0.008075238421893496 14 0.99080225455278925 15 0.0011225070253171343
		3 13 0.0072897075471750677 14 0.9865678283966024 15 0.0061424640562225408
		3 13 0.0074092814232911983 14 0.98792828147810285 15 0.0046624370986059508
		3 13 0.0084742204730040155 14 0.98959150625690206 15 0.0019342732700938223
		3 13 0.0099076641839387202 14 0.98962956042731243 15 0.00046277538874892385
		3 13 0.0020551642797600089 14 0.99735834759102382 15 0.00058648812921616828
		3 13 0.0011809672357326916 14 0.99826975704650778 15 0.00054927571775956077
		3 13 0.00068259476822107098 14 0.99736128698055415 15 0.0019561182512247543
		3 38 0.00081906685550080542 39 0.96203684523520216 40 0.037144087909296991
		3 38 0.0007031029175707731 39 0.98143352578733933 40 0.017863371295089983
		3 38 0.00055745293853062437 39 0.99511125470383199 40 0.0043312923576373846
		3 38 0.00015719449440961263 39 0.99787498759441418 40 0.0019678179111762596
		3 38 0.0001052388685292644 39 0.99547144651019337 40 0.0044233146212774473
		3 38 6.0030747835171724e-05 39 0.97087995860112131 40 0.029060010651043484
		3 38 3.9032163821721611e-05 39 0.96587365780456269 40 0.03408731003161565
		3 38 6.9779843394510504e-05 39 0.9655037831468587 40 0.034426437009746853
		3 38 0.00014352935419610532 39 0.98999698327660057 40 0.0098594873692034613
		3 38 0.00032000316141809907 39 0.99452883550497406 40 0.0051511613336079438
		3 38 0.00093112839343828697 39 0.98913398334595359 40 0.0099348882606080484
		3 38 0.00051214400365970586 39 0.95155442640239052 40 0.047933429593949764
		3 13 0.00075917984806958658 14 0.96328861325118575 15 0.0359522069007445
		3 13 0.00066213930407356403 14 0.98192438831898332 15 0.017413472376943136
		3 13 0.00060258635043551069 14 0.99521578424814405 15 0.004181629401420436
		3 13 0.00019426724633079802 14 0.99793435562465871 15 0.0018713771290104115
		3 13 0.00011244890623162164 14 0.99559018986307557 15 0.0042973612306927301
		3 13 5.8305847426446281e-05 14 0.97236409931615564 15 0.027577594836417883
		3 13 3.6841416654513844e-05 14 0.96816063036199929 15 0.031802528221346264
		3 13 6.663657265834295e-05 14 0.96662942841360866 15 0.033303935013733112
		3 13 0.00013960679674852386 14 0.99033053043023644 15 0.0095298627730150964
		3 13 0.00030081530866506677 14 0.99491189856802098 15 0.0047872861233138704
		3 13 0.00080553170327800436 14 0.98995779087662161 15 0.0092366774201004097
		3 13 0.00047731328268813716 14 0.9550663478493121 15 0.044456338867999788
		3 38 0.0024117372813743593 39 0.99722071893639441 40 0.00036754378223130812
		3 38 0.0052691352905974362 39 0.99442493908094642 40 0.00030592562845615997
		3 38 0.010426803010410549 39 0.98932255375235312 40 0.00025064323723629912
		3 12 0.00043921756197705104 38 0.024331779235560774 39 0.9752290032024622
		3 12 0.0024646777953545602 38 0.059367179162878127 39 0.93816814304176743
		3 12 0.0019829063312591572 38 0.039647980377725572 39 0.95836911329101537
		3 12 0.0031123771183841388 38 0.050789711784996895 39 0.946097911096619
		3 12 0.0029033484505619324 38 0.049667566065175806 39 0.94742908548426219
		3 12 0.0024260502147311113 38 0.058738267199807334 39 0.93883568258546157
		3 12 0.00013465284945905439 38 0.017689708553112155 39 0.98217563859742885
		3 38 0.0078820215146801799 39 0.99199774587871281 40 0.00012023260660702372
		3 38 0.004711045003544849 39 0.9951496910137424 40 0.00013926398271267538
		3 13 0.0023743176361204726 14 0.99736331903701092 15 0.00026236332686861735
		3 13 0.0050628585352504533 14 0.99470210274529169 15 0.00023503871945790118
		3 13 0.010057275392929034 14 0.98972386223500264 15 0.00021886237206825241
		3 12 0.00040991879255137381 13 0.022502184144358773 14 0.97708789706308985
		3 12 0.0027674142521908309 13 0.05491597764068188 14 0.94231660810712725
		3 12 0.0022827652131766421 13 0.03734436989127924 14 0.96037286489554419
		3 12 0.0036291427986033203 13 0.051324203318118509 14 0.94504665388327802
		3 12 0.0031030532504564626 13 0.055608120220157438 14 0.94128882652938606
		3 12 0.0022681776160242677 13 0.066853288165365371 14 0.93087853421861033
		3 12 0.00014895375149134095 13 0.019699526827463319 14 0.98015151942104539
		3 12 0.00012116634736645531 13 0.0094194376313167256 14 0.99045939602131683
		3 13 0.0053709574242581598 14 0.99450701785087314 15 0.00012202472486874924
		3 12 0.75978648192573051 13 0.10199905460892225 36 0.1382144634653473
		3 12 0.83110637565800038 36 0.13007540646534327 38 0.038818217876656395
		3 12 0.76064283286222845 36 0.13923264670541449 38 0.10012452043235709
		3 12 0.61294748445814129 36 0.20968994730224855 38 0.17736256823961019
		3 12 0.68432729118063784 13 0.10944937247258971 36 0.20622333634677237
		3 12 0.58911350939420914 13 0.1998079882598954 36 0.21107850234589554
		3 12 0.53523075460797231 13 0.11699762924144178 36 0.34777161615058605
		3 12 0.58203318462161679 13 0.045030308150301755 36 0.37293650722808142
		3 12 0.54863910654881143 36 0.33967670731917443 38 0.111684186132014
		3 12 0.59677187771911611 36 0.31688661249843786 38 0.086341509782445952
		3 12 0.72115095582173372 13 0.032321630613093441 36 0.24652741356517283
		3 12 0.58958492673849427 13 0.090843238106989341 36 0.31957183515451643
		3 12 0.51817908807499768 13 0.40382619045561385 36 0.077994721469388448
		3 12 0.63623212203096646 13 0.24619131182564402 36 0.11757656614338942
		3 12 0.71697719690138284 13 0.14896504773695696 36 0.13405775536166017
		3 12 0.66737705092596611 36 0.12171165139730772 38 0.21091129767672626
		3 12 0.55216205724728673 36 0.079115704927038691 38 0.36872223782567465
		3 12 0.35884759521365006 38 0.48708997881135158 39 0.15406242597499833
		3 12 0.18294462472413284 38 0.52298225943805665 39 0.29407311583781043
		3 12 0.06330981800873893 38 0.48376129791066513 39 0.45292888408059601
		3 12 0.015327728549906779 38 0.39057997286814899 39 0.59409229858194412
		3 12 0.0064513672474786656 38 0.29625349928239475 39 0.69729513347012662
		3 12 0.0063085673786405583 38 0.22524992086599468 39 0.7684415117553649
		3 12 0.0054763981610608022 38 0.17550003745118456 39 0.8190235643877547
		3 12 0.0059507526723779486 38 0.20815197688083376 39 0.78589727044678837
		3 12 0.0070625913734766472 38 0.25721447264708319 39 0.73572293597944016
		3 12 0.018400714469025383 38 0.36358882169695966 39 0.61801046383401514
		3 12 0.067916886585033198 38 0.45154520462966535 39 0.48053790878530145
		3 12 0.2022283681112009 38 0.46741137507992786 39 0.33036025680887121
		3 12 0.41974536634300846 38 0.4029883376701599 39 0.17726629598683161
		3 12 0.6476297495737432 38 0.28519534721001899 39 0.067174903216237952
		3 12 0.79790673691114167 36 0.052907997013058372 38 0.14918526607579982
		3 12 0.87249876740873622 36 0.071599240951558313 38 0.055901991639705516
		3 12 0.79710781700662747 13 0.15134947233499554 36 0.0515427106583769
		3 12 0.64587148124028892 13 0.29235668771340823 14 0.061771831046302933
		3 12 0.42490416273009946 13 0.40938744772840979 14 0.16570838954149067
		3 12 0.2141228101927094 13 0.46965394320351067 14 0.31622324660377982
		3 12 0.076695224861076425 13 0.44867341578031938 14 0.47463135935860412
		3 12 0.020868798002782813 13 0.36375371940122658 14 0.61537748259599057
		3 12 0.0070657052617469091 13 0.26753498149090604 14 0.72539931324734708
		3 12 0.0058872375184232531 13 0.22971673226880604 14 0.76439603021277058
		3 12 0.0052646137510960382 13 0.1989642851663341 14 0.79577110108256999
		3 12 0.0059615836801165294 13 0.24017550850993194 14 0.75386290780995158
		3 12 0.0068851730296013323 13 0.29187051680583065 14 0.70124431016456801
		3 12 0.01823532933820304 13 0.3883816318294247 14 0.5933830388323722
		3 12 0.071287447976321 13 0.50094199012580354 14 0.42777056189787543
		3 12 0.1906623321943802 13 0.5477487831919331 14 0.26158888461368662
		3 12 0.34870648153960815 13 0.51633591650926214 14 0.13495760195112991
		3 10 0.26872367560880328 11 0.43260075501548184 12 0.29867556937571488
		3 10 0.23847142226059861 11 0.41276025656377036 12 0.34876832117563106
		3 10 0.18548118031633826 11 0.4088647205420774 12 0.40565409914158435
		3 10 0.20387564284895043 11 0.50890397796848197 12 0.28722037918256754
		3 10 0.21958146207182919 11 0.60425849653875618 12 0.1761600413894146
		3 10 0.28098268541905058 11 0.62305497031442592 12 0.095962344266523572
		3 10 0.21539933602000763 11 0.60179381824576583 12 0.18280684573422637
		3 10 0.19850246058896406 11 0.50052968556353561 12 0.30096785384750036
		3 10 0.1812448407831605 11 0.39502328132139575 12 0.42373187789544364
		3 10 0.23573194891387786 11 0.40470305482558722 12 0.3595649962605349
		3 10 0.26751924168299268 11 0.43324624979168641 12 0.29923450852532096
		3 10 0.31218926046139134 11 0.46066345063732866 12 0.22714728890127997
		3 0 0.25331178692823314 10 0.34902837924604241 11 0.39765983382572445
		3 9 0.20047452116792935 10 0.35163580944402523 11 0.44788966938804547
		3 10 0.34788973071372609 11 0.46611877345439962 12 0.18599149583187422
		3 10 0.30205664953356487 11 0.47872204624961839 12 0.21922130421681674
		3 9 0.13628257942293878 10 0.33570768836361381 11 0.52800973221344749
		3 9 0.15239217884456374 10 0.35730607134018177 11 0.49030174981525432
		3 9 0.21711205602231215 10 0.39665032971595332 11 0.38623761426173464
		3 9 0.16821581496114205 10 0.35654877911463811 11 0.47523540592421992
		3 9 0.15790916207775196 10 0.33477173764308937 11 0.50731910027915872
		3 10 0.31142063201636094 11 0.48260811678178794 12 0.205971251201851
		3 9 0.20143715190967626 10 0.34877758156933292 11 0.44978526652099088
		3 9 0.2193423518725561 10 0.35011147615034122 11 0.43054617197710277
		3 12 0.090383638223634225 36 0.45480818088818292 37 0.45480818088818292
		3 12 0.093557645148538565 36 0.45322117742573065 37 0.45322117742573065
		3 12 0.091603650187152705 36 0.45419817490642361 37 0.45419817490642361
		3 12 0.10895838408472418 36 0.44552080795763799 37 0.44552080795763799
		3 12 0.1108527644641131 36 0.44457361776794346 37 0.44457361776794346
		3 12 0.10673959220042159 36 0.44663020389978919 37 0.44663020389978919
		3 12 0.095975989317475793 36 0.45201200534126207 37 0.45201200534126207
		3 12 0.096505447967403873 36 0.4517472760162981 37 0.4517472760162981
		3 12 0.099882865331580445 36 0.45005856733420979 37 0.45005856733420979
		3 12 0.093534290056959582 36 0.45323285497152022 37 0.45323285497152022
		3 12 0.10314283807472621 36 0.44842858096263688 37 0.44842858096263688
		1 12 0.092946294275604677;
	setAttr ".wl[833:999].w"
		2 36 0.45352685286219768 37 0.45352685286219768
		3 12 0.044945271426250134 36 0.63284509387007326 37 0.32220963470367658
		3 12 0.054015713956332319 36 0.6090704166486024 37 0.3369138693950654
		3 12 0.071742499573951346 36 0.61954177425736123 37 0.30871572616868731
		3 12 0.04833462211416089 36 0.61001473475104184 37 0.34165064313479726
		3 12 0.059390644223766713 36 0.58736504386441213 37 0.35324431191182115
		3 12 0.082112233424555092 36 0.60464648110078023 37 0.31324128547466473
		3 12 0.039290657705821991 36 0.66509495106646654 37 0.29561439122771155
		3 12 0.035687929293758136 36 0.66026795155912177 37 0.30404411914712021
		3 12 0.043835807863457706 36 0.65179971405754022 37 0.30436447807900219
		3 12 0.080809632088123404 36 0.62516465131064314 37 0.29402571660123356
		3 12 0.067532686176913215 36 0.58803419499550169 37 0.34443311882758521
		3 12 0.088975066862597693 36 0.61947876623615628 37 0.29154616690124602
		3 12 0.095512744094792573 36 0.45224362795260376 37 0.45224362795260376
		3 12 0.09752247090460428 36 0.45123876454769785 37 0.45123876454769785
		3 12 0.095617271481271499 36 0.45219136425936418 37 0.45219136425936418
		3 12 0.10806768635672875 36 0.44596615682163565 37 0.44596615682163565
		3 12 0.10582931961045085 36 0.44708534019477458 37 0.44708534019477458
		3 12 0.1034881633936019 36 0.44825591830319911 37 0.44825591830319911
		3 12 0.10043451424017043 36 0.44978274287991477 37 0.44978274287991477
		3 12 0.10112385263937418 36 0.44943807368031291 37 0.44943807368031291
		3 12 0.097766434047089387 36 0.45111678297645524 37 0.45111678297645524
		3 12 0.020737709346112191 36 0.54727072332138216 37 0.43199156733250554
		3 12 0.032270241406808529 36 0.52092865299678948 37 0.4468011055964019
		3 12 0.042294464053146089 36 0.54091968618700315 37 0.41678584975985083
		3 12 0.022379479163388099 36 0.53511457211637969 37 0.44250594872023213
		3 12 0.034858664273056422 36 0.51225762859198487 37 0.45288370713495874
		3 12 0.048053521207893829 36 0.53013035743111825 37 0.42181612136098789
		3 12 0.051902288364744052 36 0.55522643871986843 37 0.39287127291538765
		3 12 0.054899158558179798 36 0.51414320416045556 37 0.43095763728136466
		3 12 0.0580243420343226 36 0.54875515291587795 37 0.39322050504979938
		3 12 0.013440040772394628 36 0.57674925096045337 37 0.40981070826715188
		3 12 0.0087184901825416855 36 0.54128196063616474 37 0.44999954918129359
		3 12 0.014366938154799735 36 0.569578182952308 37 0.41605487889289233
		3 12 0.062224388358860357 36 0.46888780582056977 37 0.46888780582056977
		3 12 0.058611885610062517 36 0.47069405719496882 37 0.47069405719496882
		3 12 0.055625390898482431 36 0.47218730455075886 37 0.47218730455075886
		3 12 0.059232601573152882 36 0.47038369921342355 37 0.47038369921342355
		3 12 0.066092766461541233 36 0.46695361676922931 37 0.46695361676922931
		3 12 0.077416265117497607 36 0.46129186744125122 37 0.46129186744125122
		3 12 0.088063510005630757 36 0.45596824499718464 37 0.45596824499718464
		3 12 0.10595988947586943 36 0.44702005526206523 37 0.44702005526206523
		3 12 0.11807728803071588 36 0.44096135598464203 37 0.44096135598464203
		3 12 0.10739289729378976 36 0.44630355135310518 37 0.44630355135310518
		3 12 0.0858905672292571 36 0.45705471638537148 37 0.45705471638537148
		3 12 0.071959756539281008 36 0.4640201217303595 37 0.4640201217303595
		3 12 0.035761964228450759 36 0.48285448539307629 37 0.48138355037847302
		3 12 0.018970073631774081 36 0.49205782084911565 37 0.48897210551911036
		3 12 0.017779742686954342 36 0.49133495716978615 37 0.49088530014325943
		3 12 0.018477695304641599 36 0.49200587809859431 37 0.48951642659676392
		3 12 0.036224298591784346 36 0.48242046792121618 37 0.48135523348699949
		3 12 0.05927999541620748 36 0.47054849734301901 37 0.47017150724077345
		3 12 0.068591189644086517 36 0.46642078304789925 37 0.4649880273080142
		3 12 0.072068166212094609 36 0.46576521294258971 37 0.46216662084531568
		3 12 0.076944001977767684 36 0.46340921517403078 37 0.45964678284820171
		3 12 0.069320589307804575 36 0.46763736225117042 37 0.46304204844102498
		3 12 0.066351498846412449 36 0.46779987793337885 37 0.4658486232202087
		3 12 0.057481951912453526 36 0.47149491542434963 37 0.47102313266319695
		3 12 0.055505938800862242 36 0.47224703059956891 37 0.47224703059956891
		3 12 0.070049835309053218 36 0.46497508234547336 37 0.46497508234547336
		3 12 0.084337921128289334 36 0.45783103943585535 37 0.45783103943585535
		3 12 0.10036996399482739 36 0.44981501800258628 37 0.44981501800258628
		3 12 0.11244380270775213 36 0.44377809864612394 37 0.44377809864612394
		3 12 0.10234669316953615 36 0.44882665341523187 37 0.44882665341523187
		3 12 0.09040386920243465 36 0.45479806539878265 37 0.45479806539878265
		3 12 0.076307824352212464 36 0.46184608782389375 37 0.46184608782389375
		3 12 0.058142271275518645 36 0.47092886436224063 37 0.47092886436224063
		3 12 0.040032093034963322 36 0.47998395348251827 37 0.47998395348251827
		3 12 0.037615083343068741 36 0.48119245832846569 37 0.48119245832846569
		3 12 0.03941171659777206 36 0.48029414170111395 37 0.48029414170111395
		3 12 0.099492998223518966 36 0.45025350088824057 37 0.45025350088824057
		3 12 0.10588396873061778 36 0.44705801563469111 37 0.44705801563469111
		3 12 0.10091119975233546 36 0.44954440012383229 37 0.44954440012383229
		3 12 0.089895338753545259 36 0.45505233062322731 37 0.45505233062322731
		3 12 0.081574800432466052 36 0.45921259978376694 37 0.45921259978376694
		3 12 0.082588577601387714 36 0.45870571119930614 37 0.45870571119930614
		3 12 0.079795776955905631 36 0.46010211152204716 37 0.46010211152204716
		3 12 0.074734305114710159 36 0.46263284744264488 37 0.46263284744264488
		3 12 0.079523532423423152 36 0.46023823378828849 37 0.46023823378828849
		3 12 0.083637097941298255 36 0.45818145102935082 37 0.45818145102935082
		3 12 0.080029061651496064 36 0.45998546917425193 37 0.45998546917425193
		3 12 0.09005085228638561 36 0.45497457385680723 37 0.45497457385680723
		3 12 0.046463340819191498 36 0.47676832959040427 37 0.47676832959040427
		3 12 0.027786898795368126 36 0.486106550602316 37 0.486106550602316
		3 12 0.027046838458456849 36 0.4864765807707716 37 0.4864765807707716
		3 12 0.027574312908587865 36 0.48621284354570604 37 0.48621284354570604
		3 12 0.047527115383802318 36 0.47623644230809881 37 0.47623644230809881
		3 12 0.068118854602609635 36 0.46594057269869521 37 0.46594057269869521
		3 12 0.083764533352700316 36 0.4581177333236498 37 0.4581177333236498
		3 12 0.089357586697917504 36 0.45532945190913732 37 0.45531296139294508
		3 12 0.10057451511839426 36 0.44972191867326511 37 0.44970356620834068
		3 12 0.087237814370239322 36 0.45643366936421259 37 0.45632851626554816
		3 12 0.081254809489669622 36 0.45938797790817515 37 0.45935721260215534
		3 12 0.067980678181460086 36 0.46600966090926998 37 0.46600966090926998
		3 12 0.05692509425795543 36 0.47153745287102222 37 0.47153745287102222
		3 12 0.072438096498595006 36 0.4637809517507025 37 0.4637809517507025
		3 12 0.087523051581125763 36 0.45623847420943719 37 0.45623847420943719
		3 12 0.10630115641247856 36 0.44684942179376069 37 0.44684942179376069
		3 12 0.1163107767125222 36 0.44184461164373889 37 0.44184461164373889
		3 12 0.10653767015123988 36 0.44673116492438003 37 0.44673116492438003
		3 12 0.091214485814406679 36 0.45439275709279664 37 0.45439275709279664
		3 12 0.077762534751460707 36 0.46111873262426967 37 0.46111873262426967
		3 12 0.06037213150803928 36 0.46981393424598039 37 0.46981393424598039
		3 12 0.048808912634063055 36 0.47559554368296847 37 0.47559554368296847
		3 12 0.048174319416867166 36 0.47591284029156639 37 0.47591284029156639
		3 12 0.047666981131620816 36 0.47616650943418959 37 0.47616650943418959
		3 12 0.071623923152282346 36 0.46418803842385875 37 0.46418803842385875
		3 12 0.070026712315802195 36 0.46498664384209887 37 0.46498664384209887
		3 12 0.064126120315972771 36 0.46793693984201357 37 0.46793693984201357
		3 12 0.069611336324354497 36 0.46519433183782277 37 0.46519433183782277
		3 12 0.073066138499956662 36 0.46346693075002166 37 0.46346693075002166
		3 12 0.076088215265998529 36 0.46195589236700074 37 0.46195589236700074
		3 12 0.086863593471076445 36 0.45656820326446179 37 0.45656820326446179
		3 12 0.099143920978471675 36 0.45042803951076416 37 0.45042803951076416
		3 12 0.11020341245108875 36 0.44489829377445561 37 0.44489829377445561
		3 12 0.10134511143413144 36 0.44932744428293431 37 0.44932744428293431
		3 12 0.08646770500517674 36 0.45676614749741168 37 0.45676614749741168
		3 12 0.07212337849824331 36 0.46393831075087832 37 0.46393831075087832
		3 12 0.10474797027591506 36 0.44762601486204251 37 0.44762601486204251
		3 12 0.10852210846001212 36 0.44573894576999396 37 0.44573894576999396
		3 12 0.10302535054119079 36 0.44848732472940461 37 0.44848732472940461
		3 12 0.095053621244105255 36 0.45247318937794728 37 0.45247318937794728
		3 12 0.088397159527868488 36 0.45580142023606574 37 0.45580142023606574
		3 12 0.088108470360156885 36 0.45594576481992155 37 0.45594576481992155
		3 12 0.086722856432428219 36 0.45663857178378592 37 0.45663857178378592
		3 12 0.083601229507711969 36 0.45819938524614406 37 0.45819938524614406
		3 12 0.087806820742267977 36 0.45609658962886607 37 0.45609658962886607
		3 12 0.091530761272963335 36 0.45423461936351833 37 0.45423461936351833
		3 12 0.089441017820346955 36 0.45527949108982652 37 0.45527949108982652
		3 12 0.096745210977465773 36 0.45162739451126716 37 0.45162739451126716
		3 12 0.024753295994420124 36 0.49818830964556632 37 0.47705839436001357
		3 12 0.012213552680972349 36 0.51196429691759426 37 0.47582215040143344
		3 12 0.011136130032589229 36 0.50016121246583467 37 0.48870265750157604
		3 12 0.011954690913004077 36 0.50973176997137937 37 0.47831353911561653
		3 12 0.025120012928066395 36 0.49529609471591507 37 0.47958389235601856
		3 12 0.044488279811672353 36 0.48165666339234731 37 0.47385505679598022
		3 12 0.052218386508796573 36 0.48383419514424669 37 0.46394741834695669
		3 12 0.059177234926357007 36 0.48737009084839761 37 0.45345267422524543
		3 12 0.061448229656233783 36 0.47864248166983309 37 0.45990928867393316
		3 12 0.055960806579597434 36 0.49077587012238 37 0.4532633232980226
		3 12 0.049509986370840316 36 0.48742955088673906 37 0.46306046274242058
		3 12 0.043160841641861417 36 0.48343153898106045 37 0.47340761937707809
		3 40 0.65760250995281511 41 0.34224185946633418 42 0.00015563058085060633
		3 40 0.66416702367895109 41 0.33503931822072303 42 0.00079365810032596198
		3 15 0.66427728707240896 16 0.33477273822788461 17 0.00094997469970644743
		3 15 0.63823818628547369 16 0.36156330974663664 17 0.0001985039678896235
		3 40 0.67442091962656925 41 0.32512620430303069 42 0.00045287607039994884
		3 15 0.66504771400350293 16 0.33435196842612297 17 0.00060031757037409057
		3 40 0.61491752116232101 41 0.38197050319291581 42 0.0031119756447630484
		3 40 0.59577855856505813 41 0.40331671705474392 42 0.00090472438019798299
		3 15 0.63344544536798641 16 0.36558324620375798 17 0.00097130842825560778
		3 15 0.60936649411641342 16 0.38854052390491189 17 0.002092981978674688
		3 40 0.59957757205133677 41 0.39785743040289762 42 0.0025649975457658161
		3 15 0.61441200906188898 16 0.38357391046991274 17 0.0020140804681983552
		3 40 0.96193152761660894 41 0.03801999778823581 42 4.8474595155106151e-05
		3 40 0.95583418851368496 41 0.044101900571094942 42 6.3910915220135317e-05
		3 39 5.7982622810521141e-05 40 0.96230890585418682 41 0.037633111523002645
		3 39 0.00017271620002990581 40 0.96853128420064039 41 0.031295999599329889
		3 39 0.00049819178084621423 40 0.97733905508466667 41 0.022162753134487147
		3 39 0.00019168368010166176 40 0.97886502649265072 41 0.020943289827247635
		3 39 4.9217641178382211e-05 40 0.98367631269569167 41 0.016274469663129797
		3 40 0.98303496914237376 41 0.016916465200982278 42 4.8565656644084085e-05
		3 40 0.9887383164512179 41 0.011230425080321417 42 3.1258468460789533e-05
		3 40 0.98357818457003998 41 0.016399181744842114 42 2.2633685117887259e-05
		3 39 4.1953547928400002e-05 40 0.98667207721470385 41 0.013285969237367514
		3 39 5.0954155108575642e-05 40 0.9838070711478536 41 0.016141974697037643
		3 14 5.7051741781293318e-05 15 0.96212745521686716 16 0.037815493041351497;
	setAttr ".wl[1000:1166].w"
		3 14 3.948947782460594e-05 15 0.96192784718058544 16 0.038032663341590008
		3 14 7.7406559646908145e-05 15 0.9692262478678918 16 0.030696345572461294
		3 14 0.00018800004871598772 15 0.97134665428124034 16 0.028465345670043694
		3 14 0.0004839111453180187 15 0.97689761895176797 16 0.022618469902914072
		3 14 0.00019355345258606428 15 0.98002305419167068 16 0.019783392355743348
		3 14 5.9805111449479732e-05 15 0.98739522538056923 16 0.012544969507981379
		3 15 0.98836659500476798 16 0.011601735875008266 17 3.1669120223808527e-05
		3 14 3.7856032536698763e-05 15 0.99235106128714756 16 0.0076110826803157169
		3 14 3.9054961737232884e-05 15 0.98753610753893406 16 0.012424837499328734
		3 14 7.0822683330536693e-05 15 0.98836793984357885 16 0.011561237473090675
		3 14 7.1457620817154456e-05 15 0.98446043400813987 16 0.015468108371043069
		3 39 0.00024998317553756908 40 0.99739747974430926 41 0.0023525370801532066
		3 39 0.00017018759115197172 40 0.99350149334871163 41 0.0063283190601365717
		3 39 0.00055772646202752055 40 0.99565947763687423 41 0.0037827959010982713
		3 39 0.0028133391433254737 40 0.99446916674782315 41 0.0027174941088512748
		3 39 0.0064243943247969792 40 0.99237601575592005 41 0.0011995899192830484
		3 39 0.0028265224421446214 40 0.99510420248357434 41 0.0020692750742809874
		3 39 0.00061276648651439588 40 0.99742853443741941 41 0.0019586990760661958
		3 39 0.00012090892050605391 40 0.99752537553640264 41 0.0023537155430913849
		3 39 0.0001549131264965566 40 0.99858080466780219 41 0.0012642822057012076
		3 39 0.00022462454047751575 40 0.99875346273530685 41 0.0010219127242154613
		3 39 0.00089512508394470533 40 0.99872287424066863 41 0.00038200067538671939
		3 39 0.00053247897845788597 40 0.99867835981742992 41 0.00078916120411212762
		3 14 0.00042214969731034355 15 0.99740139617771306 16 0.002176454124976654
		3 14 0.00025863257440025995 15 0.99444363789232915 16 0.0052977295332705997
		3 14 0.00069331109783499028 15 0.99631130487100361 16 0.0029953840311613871
		3 14 0.0027736505161310892 15 0.99467533700565747 16 0.0025510124782115763
		3 14 0.0063177886549881579 15 0.99242033219359471 16 0.0012618791514170198
		3 14 0.0028599763101267686 15 0.99505904406106271 16 0.0020809796288105476
		3 14 0.00068838898562582982 15 0.9976540578705384 16 0.001657553143835609
		3 14 0.00019380723535770955 15 0.99826881424397718 16 0.0015373785206649164
		3 14 0.00028650041284150601 15 0.99899615361204808 16 0.0007173459751104545
		3 14 0.00034556507909366092 15 0.99903187699542351 16 0.00062255792548291994
		3 14 0.0014596812358688091 15 0.99825453988623247 16 0.00028577887789868933
		3 14 0.00099511971265228206 15 0.99842501245562665 16 0.00057986783172108466
		3 39 0.001637543757988077 40 0.99830893576844926 41 5.3520473562732088e-05
		3 39 0.001027479778760141 40 0.9987818921195154 41 0.00019062810172451052
		3 39 0.0049742718486751663 40 0.99486482596697501 41 0.00016090218434990146
		3 39 0.025771987768132786 40 0.97411368674419929 41 0.00011432548766798439
		3 39 0.028427278195020569 40 0.97148801796444961 41 8.470384052989218e-05
		3 39 0.024769068348822906 40 0.97512179111738273 41 0.000109140533794381
		3 39 0.0048818029393119947 40 0.99496727907378391 41 0.00015091798690409469
		3 39 0.0010170190247021534 40 0.99878941071544602 41 0.00019357025985166395
		3 39 0.001137673829302829 40 0.99881869582802596 41 4.3630342671196581e-05
		3 39 0.0035021451260024493 40 0.99648285390340829 41 1.5000970589300244e-05
		3 39 0.011466854568809434 40 0.98852453307864563 41 8.6123525450299223e-06
		3 39 0.0098562667376733346 40 0.99012582083712908 41 1.7912425197580918e-05
		3 14 0.0029465658531044334 15 0.99700920428199169 16 4.422986490407965e-05
		3 14 0.0015196452742745432 15 0.99833255152872913 16 0.00014780319699644141
		3 14 0.0052468263184042548 15 0.99463437576385216 16 0.00011879791774355369
		3 14 0.02521160667962705 15 0.97469607011136161 16 9.2323209011432216e-05
		3 14 0.028676919228509935 15 0.97124790461985211 16 7.5176151638077054e-05
		3 14 0.025515892361551131 15 0.97437929411841873 16 0.00010481352003014949
		3 14 0.0050919749160438571 15 0.99475505223285943 16 0.00015297285109669738
		3 14 0.0012657594556653076 15 0.99854897663030751 16 0.00018526391402720995
		3 14 0.0014397261055152995 15 0.99852203823848973 16 3.8235655995024071e-05
		3 14 0.0040098793744023911 15 0.99597558482437976 16 1.4535801217788275e-05
		3 14 0.014412855650991185 15 0.98557980101713905 16 7.3433318698110306e-06
		3 14 0.014338828006410757 15 0.9856469547053156 16 1.4217288273481374e-05
		3 40 0.011599955421653865 41 0.78689848883685953 42 0.20150155574148662
		3 40 0.087789050234311647 41 0.83722342620658008 42 0.074987523559108316
		3 40 0.10302635890928463 41 0.846920590926594 42 0.050053050164121378
		3 40 0.019561149306249515 41 0.79174814566836516 42 0.18869070502538543
		3 41 0.47701344445684668 42 0.34881495392126388 43 0.17417160162188949
		3 41 0.75563986220922796 42 0.17266774073067825 45 0.071692397060093657
		3 40 0.048499140537635106 41 0.85505844842665313 42 0.096442411035711828
		3 41 0.72065399802356167 42 0.24693952644219683 43 0.032406475534241447
		3 41 0.55998214738601448 42 0.34065059917058377 43 0.099367253443401735
		3 41 0.8037997445845011 42 0.15911055366896237 43 0.037089701746536557
		3 41 0.63890748700828937 42 0.25839322223953548 43 0.10269929075217518
		3 41 0.76882991028869208 42 0.072168995206207953 45 0.15900109450509992
		3 41 0.66789427941483459 42 0.17293494764188055 45 0.1591707729432848
		3 41 0.43291313494277184 42 0.34805596396727151 43 0.21903090108995671
		3 41 0.54285117714884812 42 0.28952201786446335 43 0.16762680498668855
		3 41 0.70288164625282268 42 0.1001915035852205 45 0.19692685016195682
		3 40 0.018143649459660374 41 0.79256188134235861 42 0.18929446919798096
		3 40 0.13085177186892721 41 0.81430292060499099 42 0.054845307526081785
		3 40 0.014977482426987813 41 0.83755920136373718 42 0.14746331620927491
		3 40 0.066349669105851036 41 0.90264362563921197 42 0.031006705254937126
		3 41 0.86185562634708734 42 0.080075524548884169 45 0.058068849104028437
		3 41 0.69486201453664986 42 0.25366670657844559 45 0.051471278884904458
		3 41 0.74860054724049074 42 0.23231652125130139 43 0.019082931508207761
		3 41 0.92203982114115535 42 0.065817640238170314 45 0.012142538620674338
		3 41 0.80770015584029131 53 0.020636944838630614 57 0.17166289932107803
		3 41 0.61062282574253424 53 0.062825469575324908 57 0.3265517046821409
		3 41 0.5963021931670065 53 0.08669539928722772 57 0.31700240754576575
		3 41 0.82306498323208233 53 0.026489049282873996 57 0.15044596748504363
		3 41 0.86602072258219498 53 0.0090555947980756873 57 0.1249236826197293
		3 41 0.67558179069869684 53 0.029467063910254269 57 0.29495114539104894
		3 41 0.82131171846241913 45 0.10414098608646259 49 0.074547295451118226
		3 41 0.78974847613376753 45 0.16610941927927314 49 0.044142104586959441
		3 41 0.81620924109935433 53 0.072494031574707657 57 0.11129672732593807
		3 41 0.69763104047299396 45 0.14587072921899907 49 0.15649823030800683
		3 41 0.62790857785963772 45 0.26374850034143382 49 0.10834292179892853
		3 41 0.55811115245971399 53 0.21154214078460704 57 0.23034670675567892
		3 41 0.67155333443181631 45 0.28141422833201102 49 0.04703243723617264
		3 41 0.63791928978326973 45 0.2886974048995915 49 0.07338330531713888
		3 41 0.63482912666619373 45 0.24795694673622717 49 0.11721392659757911
		3 41 0.55832750960088606 45 0.37387572250571 49 0.0677967678934039
		3 41 0.498531667742733 45 0.40687067329236298 49 0.094597658964904019
		3 41 0.48612493810989821 45 0.33891493003142292 49 0.17496013185867887
		3 41 0.88922169998990253 42 0.069868419599618661 57 0.040909880410478792
		3 41 0.91993288483828606 42 0.018579836226172153 57 0.061487278935541734
		3 41 0.8225695100320628 53 0.094327986746902043 57 0.083102503221035157
		3 41 0.80134851623454395 53 0.053572646001263338 57 0.14507883776419259
		3 41 0.72074800582758092 45 0.15282572532645022 49 0.12642626884596878
		3 41 0.62913830031753337 49 0.17071258478721446 53 0.20014911489525222
		3 41 0.62347678064192402 53 0.14732820909030064 57 0.22919501026777533
		3 41 0.54732954127591349 45 0.21846700114425124 49 0.23420345757983518
		3 40 0.0293923922495683 41 0.95389781438514087 57 0.016709793365290774
		3 40 0.019043861005241879 41 0.9247398079001492 42 0.056216331094608871
		3 40 0.12673772261949962 41 0.86897170306785954 42 0.0042905743126408734
		3 40 0.12162314020841819 41 0.85663296667786737 42 0.021743893113714462
		3 40 0.12142179212326462 41 0.87688527877296807 57 0.0016929291037673223
		3 40 0.11802363956965087 41 0.87997474880468729 57 0.0020016116256619436
		3 40 0.13084047513315583 41 0.86653956890982486 57 0.002619955957019156
		3 40 0.038402668639204107 41 0.95459670019990117 57 0.0070006311608946208
		3 40 0.039567358793277628 41 0.95112742784843574 57 0.0093052133582866986
		3 40 0.03385264637974332 41 0.95234522429302726 57 0.013802129327229498
		3 40 0.12040570182298535 41 0.8753630571933777 42 0.0042312409836369209
		3 40 0.15125765532022464 41 0.8476453048924113 57 0.0010970397873641866
		3 40 0.01921476320465396 41 0.96966447282362545 42 0.011120763971720547
		3 40 0.030208714407564407 41 0.96110678958389906 57 0.0086844960085366296
		3 41 0.35307104334243178 42 0.60513944212563275 43 0.041789514531935544
		3 41 0.13603393896890459 42 0.71441713213095714 43 0.14954892890013838
		3 41 0.17467217447574601 42 0.6317220405574353 43 0.19360578496681857
		3 41 0.38374950879024067 42 0.54074781267952399 43 0.075502678530235262
		3 41 0.46368349625406657 42 0.50599133349535541 43 0.030325170250577998
		3 41 0.23784928778202416 42 0.65763700422618254 43 0.1045137079917932
		3 41 0.031171030807571009 42 0.50156971364708514 43 0.46725925554534375
		3 41 0.092538336949813033 42 0.5642234155178113 43 0.34323824753237558
		3 41 0.28742932372987778 42 0.56505834249511588 43 0.14751233377500625
		3 41 0.11726615210273945 42 0.5934935898629814 43 0.28924025803427916
		3 41 0.063294274228093819 42 0.55425764904466379 43 0.38244807672724229
		3 41 0.17591064034541773 42 0.58190515803252518 43 0.24218420162205714
		3 41 0.022401254034342004 42 0.49123803486930578 43 0.48636071109635215
		3 41 0.10112168093941155 42 0.54263641784577676 43 0.35624190121481164
		3 41 0.072130076157125911 42 0.5131925603670896 43 0.41467736347578443
		3 42 0.44286679246941246 43 0.52582298303158315 44 0.031310224499004523
		3 42 0.43666645082771727 43 0.52767520463694328 44 0.035658344535339476
		3 41 0.0771989435762446 42 0.50754807629964827 43 0.41525298012410722
		3 41 0.074787072071866065 42 0.70178219738633074 43 0.2234307305418031
		3 41 0.25212150816127488 42 0.67111745551507984 43 0.076761036323645393
		3 41 0.14050911233595187 42 0.59865482931995839 43 0.26083605834408974
		3 41 0.032864512048802551 42 0.54750425005659831 43 0.41963123789459905
		3 41 0.047442408563795627 42 0.62822584845901719 43 0.3243317429771872
		3 41 0.18219810616838356 42 0.66397925982887418 43 0.15382263400274224
		3 41 0.93314431851892898 45 0.039122584973044362 49 0.027733096508026744
		3 41 0.9427398443155709 53 0.017083092983972238 57 0.040177062700457067
		3 40 0.0062215892386062411 41 0.95168319973747062 57 0.042095211023923135
		3 40 0.0065830244534743239 41 0.9543991277226378 57 0.039017847823887813
		3 41 0.93374754809411331 53 0.0059973865506465331 57 0.060255065355240285
		3 42 0.10717855955383246 43 0.73649220292125261 44 0.15632923752491498
		3 42 0.089493911221577765 43 0.623735661810497 44 0.28677042696792515
		3 42 0.098161903918556684 43 0.68742055965545468 44 0.2144175364259886
		3 42 0.13216727578599174 43 0.75574918318344841 44 0.11208354103055979
		3 42 0.11105677088816518 43 0.77651148693518479 44 0.11243174217664995
		3 42 0.18062056904432436 43 0.74722478585908958 44 0.072154645096586117
		3 42 0.064971714843571338 43 0.67394942698474369 44 0.26107885817168491
		3 42 0.086708343489979647 43 0.75994668155112421 44 0.15334497495889601
		3 42 0.0740620319892559 43 0.72519169200437494 44 0.20074627600636916
		3 42 0.067316455190006341 43 0.58162184007469064 44 0.35106170473530307
		3 42 0.055259975925092922 43 0.6148509573632559 44 0.3298890667116513
		3 42 0.038530376467901889 43 0.56165046003773322 44 0.39981916349436508
		3 42 0.0069610762930057213 43 0.50857886889148729 44 0.48446005481550714
		3 42 0.011495932444309766 43 0.57247062224815159 44 0.4160334453075385
		2 42 0.010808806117746138 43 0.59660477567830472;
	setAttr ".wl[1166:1333].w"
		1 44 0.39258641820394918
		3 42 0.0058406145031082331 43 0.52492279869879288 44 0.46923658679809893
		3 42 0.0071236401953717219 43 0.52087696354852486 44 0.47199939625610343
		3 42 0.014370477975806831 43 0.61361141120768525 44 0.37201811081650804
		3 42 0.0067700819667485699 43 0.49675110739478656 44 0.49647881063846483
		3 42 0.0096320654410027278 43 0.50229012356726488 44 0.48807781099173253
		3 42 0.011205589493131329 43 0.54170574563043838 44 0.44708866487643023
		3 42 0.0058029227857584595 43 0.50415804307665768 44 0.49003903413758387
		3 42 0.0064483828934411855 43 0.49808212436820604 44 0.49546949273835295
		3 42 0.011122698897519394 43 0.51591533519838539 44 0.47296196590409523
		3 42 0.0072554452907195709 43 0.49660618935173029 44 0.49613836535755013
		3 42 0.0073263318053346099 43 0.50239454676491402 44 0.49027912142975133
		3 42 0.0079959311385756002 43 0.49867895462734607 44 0.49332511423407832
		3 42 0.0078460206595337405 43 0.49607702790139696 44 0.49607695143906916
		3 42 0.0089075380721683594 43 0.49554624420913629 44 0.49554621771869528
		3 42 0.0072312961166590322 43 0.49749440764377367 44 0.4952742962395672
		3 42 0.0073851345838463591 43 0.5118808694149215 44 0.48073399600123212
		3 42 0.0061802877632568341 43 0.49790236716497616 44 0.49591734507176694
		3 42 0.0047432005565339642 43 0.5074205745070689 44 0.48783622493639711
		3 42 0.0081548870118032819 43 0.5543801510248143 44 0.43746496196338236
		3 42 0.0071516703829236456 43 0.52745989543161453 44 0.46538843418546177
		3 42 0.0053250817661303967 43 0.50008203452858035 44 0.4945928837052892
		3 42 0.011988052359061556 43 0.49400597382046924 44 0.49400597382046924
		3 42 0.0099167043772096352 43 0.49504164781139515 44 0.49504164781139515
		3 42 0.01100834730481866 43 0.49449582634759065 44 0.49449582634759065
		3 42 0.0093228032559034366 43 0.4953385983720483 44 0.4953385983720483
		3 42 0.011163138066430132 43 0.49441843096678501 44 0.49441843096678501
		3 42 0.010129257371248403 43 0.49493537131437582 44 0.49493537131437582
		3 42 0.0091214766066705782 43 0.49607880977935637 44 0.49479971361397307
		3 42 0.0098835410512882402 43 0.49673097400058358 44 0.49338548494812817
		3 42 0.0076615961059664679 43 0.49903404770464982 44 0.49330435618938384
		3 42 0.0084308291250723439 43 0.49578458543746384 44 0.49578458543746384
		3 42 0.0067363761308048987 43 0.49753529013682296 44 0.49572833373237213
		3 42 0.0084483892054982909 43 0.49577580539725091 44 0.49577580539725091
		3 42 0.0056351527948015961 43 0.49927006854890194 44 0.49509477865629647
		3 42 0.0069939418006591423 43 0.49650302909967042 44 0.49650302909967042
		3 42 0.0077975694830203154 43 0.49610121525848982 44 0.49610121525848982
		3 42 0.034776094519890104 43 0.71659422617881485 44 0.24862967930129509
		3 42 0.058879872019009065 43 0.75092633651085416 44 0.19019379147013685
		3 42 0.042378174689341894 43 0.69825495164194018 44 0.2593668736687178
		3 42 0.037209351455387896 43 0.64826219167045163 44 0.31452845687416031
		3 42 0.03695437077806165 43 0.58930310219990567 44 0.3737425270220327
		3 42 0.031296314154019976 43 0.541634298844756 44 0.42706938700122399
		3 42 0.020742106694864017 43 0.52040366559793727 44 0.45885422770719864
		3 42 0.012188468638527308 43 0.51135269752020651 44 0.47645883384126619
		3 42 0.016716511457262068 43 0.53828182448254414 44 0.4450016640601937
		3 42 0.019075645787942248 43 0.57649581503920677 44 0.40442853917285099
		3 42 0.021793522236152656 43 0.62213048788655367 44 0.35607598987729355
		3 42 0.027611862872785841 43 0.67190333255545753 44 0.30048480457175647
		3 42 0.35705450043991704 43 0.59195788152062834 44 0.050987618039454695
		3 42 0.3220446832570002 43 0.60301471809297691 44 0.074940598650022797
		3 42 0.27367589971717454 43 0.61277789203213562 44 0.1135462082506897
		3 42 0.33994294000665554 43 0.5948308053987813 44 0.065226254594563216
		3 42 0.3803465191491231 43 0.58075415344593306 44 0.03889932740494393
		3 42 0.43414134064979504 43 0.54008690911552049 44 0.025771750234684535
		3 42 0.51185897800469704 43 0.47176469599233989 44 0.016376326002963071
		3 41 0.034228154856139177 42 0.58858692233094656 43 0.37718492281291432
		3 41 0.080505291262957329 42 0.6401099742360008 43 0.27938473450104184
		3 41 0.056567991625600562 42 0.54335860078111231 43 0.40007340759328724
		3 41 0.038594780019254281 42 0.47093136527063989 43 0.49047385471010579
		3 42 0.41145313300453112 43 0.55555388715952225 44 0.032992979835946484
		3 41 0.6086798986587697 42 0.38198524169715786 43 0.009334859644072319
		3 41 0.57162489417070883 42 0.40942133586170792 43 0.018953769967583339
		3 41 0.45208299750560244 42 0.4877822062319993 43 0.060134796262398309
		3 41 0.38967140544900902 42 0.47686525533371577 43 0.13346333921727532
		3 41 0.31803366189356547 42 0.45693505202098217 43 0.22503128608545231
		3 41 0.24405947985453985 42 0.45499001001947609 43 0.30095051012598406
		3 41 0.21710715711253481 42 0.46872590545294018 43 0.31416693743452501
		3 41 0.24927277401856182 42 0.50420222747521926 43 0.24652499850621898
		3 41 0.35690204443944351 42 0.4990934360909029 43 0.14400451946965351
		3 41 0.51101919393734618 42 0.4195895451374419 43 0.069391260925211987
		3 41 0.60899629172679337 42 0.36531942776663667 43 0.025684280506569929
		3 41 0.65922688815423347 42 0.33193725949400399 43 0.0088358523517625669
		3 42 0.24924853938207461 43 0.69015878056251978 44 0.060592680055405676
		3 42 0.30710949988183844 43 0.65308384269562725 44 0.039806657422534461
		3 42 0.40798016803438125 43 0.56885041582945706 44 0.023169416136161587
		3 42 0.2938757780700279 43 0.66538040433062584 44 0.040743817599346269
		3 42 0.22985765090867305 43 0.7071499886607755 44 0.062992360430551536
		3 42 0.19813929245002193 43 0.71438345387133306 44 0.087477253678644923
		3 42 0.17913098545899239 43 0.69606753183026349 44 0.12480148271074411
		3 42 0.15794929675943126 43 0.65819844926697746 44 0.18385225397359128
		3 42 0.1158641469902633 43 0.62152501597039445 44 0.26261083703934229
		3 42 0.16786658239436225 43 0.63314368183239589 44 0.19898973577324175
		3 42 0.19419632446365304 43 0.66546475353311618 44 0.14033892200323075
		3 42 0.21497093195223402 43 0.69296196436424873 44 0.09206710368351724
		3 49 0.048933048763021236 50 0.86967093586686928 51 0.081396015370109473
		3 46 0.14087724950169644 49 0.14664104102859832 50 0.71248170946970513
		3 49 0.14852512842540191 50 0.74135503782333134 54 0.11011983375126685
		3 49 0.053424484221183406 50 0.84766579480709903 51 0.098909720971717657
		3 49 0.093124987683883637 50 0.85503812323102013 51 0.051836889085096233
		3 45 0.061444216432871748 49 0.22243116577242009 50 0.71612461779470826
		3 45 0.17169911565499513 49 0.27592940360509721 50 0.55237148073990772
		3 45 0.09640935337467002 49 0.34532438919089636 50 0.5582662574344337
		3 49 0.27458722088947535 50 0.62426977501425274 54 0.10114300409627175
		3 45 0.23875648744754904 49 0.36046656013377004 50 0.40077695241868083
		3 45 0.13761952362826513 49 0.4369049479476832 50 0.42547552842405167
		3 49 0.35544729602664243 50 0.49609791784441826 54 0.14845478612893925
		3 45 0.29228628005456986 49 0.41205185351917867 50 0.29566186642625153
		3 45 0.21747412324902493 49 0.49572384585437979 50 0.28680203089659517
		3 49 0.44581520239899702 50 0.36922909574727941 54 0.18495570185372362
		3 45 0.42366973565437938 49 0.32810821167683035 50 0.24822205266879024
		3 41 0.160702500207863 45 0.49515698134998071 49 0.34414051844215637
		3 45 0.053397238730958689 46 0.89894428285473482 47 0.047658478414306489
		3 45 0.13830872854077925 46 0.84407872197915679 47 0.017612549480063844
		3 45 0.12119181692283255 46 0.76759354215853393 50 0.11121464091863352
		3 45 0.07007905417303989 46 0.88237882849420735 47 0.04754211733275264
		3 45 0.061363747448918878 46 0.90945572706184841 47 0.029180525489232712
		3 45 0.11968956839751868 46 0.84225555431957688 50 0.038054877282904465
		3 45 0.28639870095487607 46 0.69418643452527784 49 0.01941486451984616
		3 45 0.25513967824059719 46 0.69393215273368924 50 0.050928169025713677
		3 45 0.20697004817871076 46 0.62381256048362665 50 0.16921739133766242
		3 45 0.43741418170079349 46 0.53675437345185006 49 0.02583144484735642
		3 45 0.45968976588368343 46 0.47919401461204625 49 0.061116219504270292
		3 45 0.37733915290865716 46 0.45673708700772769 50 0.16592376008361504
		3 45 0.57967696544950253 46 0.37745150355272067 49 0.042871530997776887
		3 45 0.62237949677852811 46 0.2583099485029029 49 0.11931055471856893
		3 45 0.52863276112190094 46 0.27756890499875575 49 0.19379833387934334
		3 50 0.19353969456164255 54 0.72666486920687579 55 0.079795436231481554
		3 50 0.26934634512462069 53 0.12228394192315857 54 0.60836971295222075
		3 53 0.18630783650530597 54 0.63790710143943929 58 0.17578506205525474
		3 53 0.093729708002418172 54 0.809679774302415 58 0.096590517695166772
		3 50 0.100427030298556 53 0.10164996705940509 54 0.79792300264203897
		3 50 0.090009199672042864 53 0.2086287868514457 54 0.70136201347651139
		3 50 0.27752927590907212 53 0.21701724961001367 54 0.50545347448091416
		3 50 0.072962016122963907 53 0.34371865787953632 54 0.58331932599749992
		3 53 0.29104331097200198 54 0.56918831738596953 58 0.13976837164202835
		3 49 0.16315270250182407 53 0.36097481118295421 54 0.47587248631522178
		3 49 0.082093846295195907 53 0.44866405472196041 54 0.46924209898284353
		3 53 0.39543457714199215 54 0.49446943723510545 58 0.11009598562290236
		3 49 0.20433334715513463 53 0.42795158513851023 54 0.3677150677063552
		3 49 0.15821755976726345 53 0.5095378514159582 54 0.33224458881677832
		3 53 0.47646027299177957 54 0.39449346189288842 57 0.12904626511533204
		3 49 0.3282858683987171 53 0.33941891848838912 54 0.33229521311289378
		3 49 0.39528591435985699 53 0.38694496827821706 54 0.21776911736192597
		3 54 0.068632370966307935 58 0.74726866532597014 59 0.18409896370772186
		3 54 0.2134470400460993 57 0.13270733984245611 58 0.65384562011144465
		3 54 0.027558874231596031 57 0.15605801761934404 58 0.81638310814906001
		3 57 0.081148357141474614 58 0.8423194495816605 59 0.076532193276864779
		3 57 0.09473581583935467 58 0.77551298186808193 59 0.12975120229256334
		3 54 0.088622382359508534 57 0.15958890021715516 58 0.75178871742333619
		3 54 0.24494283234570066 57 0.21007881445955498 58 0.5449783531947443
		3 54 0.097408105361101283 57 0.24848623811233925 58 0.65410565652655939
		3 54 0.032732084279204751 57 0.30041973648662829 58 0.66684817923416695
		3 53 0.22990407184504932 57 0.29719627488214356 58 0.4728996532728072
		3 53 0.11688560188013809 57 0.38027484999100436 58 0.50283954812885745
		3 53 0.035325804590321974 57 0.40945873004208033 58 0.5552154653675978
		3 53 0.34281847560398421 57 0.34152125922834109 58 0.3156602651676747
		3 53 0.20087470591055578 57 0.48117287481580834 58 0.31795241927363582
		3 53 0.057171846586430465 57 0.49032349674215442 58 0.45250465667141515
		3 53 0.45594730934639555 54 0.33138002298198499 57 0.21267266767161958
		3 53 0.46632277355330343 54 0.2401116040223871 57 0.29356562242430945
		3 53 0.054263283383628819 54 0.83724188174980241 58 0.10849483486656888
		3 53 0.13449687263114982 54 0.6785620065468414 58 0.18694112082200867
		3 49 0.064361999070609285 50 0.2376205804557428 54 0.6980174204736479
		3 50 0.16854548112111722 54 0.75770214194510288 55 0.073752376933779923
		3 50 0.066376619180340352 54 0.88196327002444397 55 0.051660110795215736
		3 50 0.068046054339767514 53 0.087318054030745954 54 0.84463589162948649
		3 53 0.23596360849223474 54 0.56595556526372093 58 0.19808082624404427
		3 53 0.18972545693318285 54 0.74371226040247429 58 0.066562282664342762
		3 50 0.15794434147754327 53 0.11484229354313638 54 0.72721336497932054
		3 53 0.31641300865278832 54 0.49431003424459624 58 0.1892769571026155
		3 53 0.31497407453908949 54 0.60901270692455145 58 0.076013218536358979
		3 50 0.11906206896789279 53 0.20831325437130158 54 0.6726246766608055
		3 53 0.37745087035761038 54 0.44363845272897556 57 0.17891067691341409
		3 49 0.15049334547214457 53 0.40892796922110969 54 0.44057868530674565
		3 49 0.16986656642748579 53 0.29039020427555995 54 0.5397432292969544
		3 53 0.093446021664270268 54 0.16531682311847432 58 0.74123715521725542
		1 54 0.052898000127490533;
	setAttr ".wl[1333:1499].w"
		2 58 0.78743692934670884 59 0.15966507052580045
		3 57 0.031688397181671844 58 0.91827520305405552 59 0.050036399764272606
		3 54 0.01586692074196375 57 0.088441783731500245 58 0.89569129552653615
		3 54 0.05587573397353348 57 0.077514085807921254 58 0.86661018021854519
		3 54 0.032874797902910702 58 0.86267506673445937 59 0.10445013536262976
		3 54 0.017963953849597394 57 0.2147793563344266 58 0.76725668981597606
		3 54 0.058808586368417633 57 0.19210309059043568 58 0.74908832304114681
		3 54 0.18339967866467077 57 0.15581937790310676 58 0.66078094343222249
		3 54 0.017082473677463995 57 0.35813097835667823 58 0.62478654796585775
		3 53 0.058719530728162821 57 0.37074387227617406 58 0.57053659699566306
		3 54 0.16281391876232865 57 0.29743361764091208 58 0.53975246359675921
		3 53 0.033841346607645525 57 0.48856272052943911 58 0.47759593286291535
		3 53 0.11780679485254786 57 0.5125325683298898 58 0.36966063681756239
		3 53 0.17682661420363516 57 0.40657878254630458 58 0.4165946032500602
		3 53 0.36979424972646197 54 0.25507297347251273 57 0.37513277680102541
		3 53 0.31436249746380796 57 0.32966348358755515 58 0.35597401894863684
		3 46 0.12242088020913915 49 0.116666112434289 50 0.76091300735657197
		3 49 0.043384712722574541 50 0.81914859308752908 51 0.13746669418989643
		3 49 0.053732036011872236 50 0.78951986227760096 51 0.15674810171052683
		3 49 0.10438169068565954 50 0.75451980084872328 54 0.1410985084656172
		3 49 0.15554380843597135 50 0.76825975006221348 54 0.076196441501815121
		3 49 0.063212662862594735 50 0.82035785388663207 51 0.11642948325077322
		3 49 0.19116880157931049 50 0.56952568185905372 54 0.23930551656163576
		3 49 0.30179149462158122 50 0.57348140242990886 54 0.12472710294851011
		3 46 0.19578840902797934 49 0.23026581033782592 50 0.57394578063419477
		3 49 0.28896982204731453 50 0.41837216916555553 54 0.29265800878713011
		3 45 0.13663823577468756 49 0.4335279599177716 50 0.42983380430754092
		3 45 0.22764129915108419 49 0.35277062477910615 50 0.41958807606980958
		3 49 0.37956501735435583 50 0.32048545321967431 54 0.29994952942597003
		3 45 0.17623354156998736 49 0.52113772518862111 50 0.30262873324139145
		3 45 0.26903191502358004 49 0.42540630749988129 50 0.30556177747653879
		3 49 0.38721076849995234 53 0.30281865643665878 54 0.30997057506338893
		3 49 0.26924010569643581 53 0.21220056669762893 54 0.51855932760593537
		3 45 0.22781747571423111 46 0.74820154418274187 47 0.023980980103026888
		3 45 0.090561907219626731 46 0.82657873068294729 47 0.082859362097425962
		3 45 0.079494936696382884 46 0.82850902676871607 47 0.091996036534900932
		3 45 0.19510882843052574 46 0.67344714653286253 50 0.13144402503661173
		3 45 0.22636949910262352 46 0.7281833339914181 50 0.045447166905958403
		3 45 0.10891557816083314 46 0.81420239728103561 47 0.076882024558131326
		3 45 0.31797713636079572 46 0.55650695487790125 50 0.12551590876130292
		3 45 0.34997461019528781 46 0.58257349077448006 49 0.067451899030232076
		3 45 0.40719638987116047 46 0.55118701297019868 49 0.041616597158641085
		3 45 0.42755553069850999 46 0.39505735555402471 49 0.17738711374746521
		3 45 0.50740895261090013 46 0.38563710594775158 49 0.10695394144134845
		3 45 0.52873610170852714 46 0.41484268203190588 49 0.056421216259566996
		3 45 0.50016092798047374 46 0.25946888716475419 49 0.24037018485477205
		3 45 0.6106424824722414 46 0.20907366280574799 49 0.18028385472201078
		3 45 0.60730417710718543 46 0.32087605780979106 49 0.071819765083023485
		3 45 0.3993127206338804 49 0.41645959701123841 50 0.18422768235488107
		3 45 0.41953504960323762 46 0.23882630403726293 49 0.34163864635949942
		3 45 0.06900667471411423 46 0.8612141893216646 47 0.069779135964221195
		3 45 0.17495208683635133 46 0.80061195171095834 47 0.024435961452690318
		3 45 0.3327538451121404 46 0.64775016716872147 49 0.019495987719137988
		3 45 0.51214791542468008 46 0.45394010435101445 49 0.033911980224305423
		3 41 0.049180029850666884 45 0.62332278414571396 46 0.32749718600361921
		3 57 0.052297697212818933 58 0.90165126968392573 59 0.046051033103255347
		3 54 0.011236303152451574 57 0.12134283630613851 58 0.86742086054140988
		3 54 0.013862046272451443 57 0.24644146565075578 58 0.73969648807679278
		3 53 0.017622669314655066 57 0.41103786638428885 58 0.5713394643010562
		3 41 0.034422903144567259 57 0.51916740209389611 58 0.44640969476153669
		3 41 0.14608516253720741 57 0.55818853351234521 58 0.29572630395044747
		3 41 0.14172849322924624 45 0.64034914564292011 46 0.21792236112783361
		3 53 0.28109361910396452 54 0.34869453412673512 58 0.37021184676930047
		3 49 0.21212497536110206 50 0.25805779693044151 54 0.52981722770845641
		3 45 0.36358805608342992 46 0.34045203065718382 49 0.29595991325938631
		3 45 0.38334272185101259 49 0.27499043742825119 50 0.34166684072073611
		3 49 0.29330570889363461 50 0.35958473538474617 54 0.34710955572161922
		3 53 0.37346368078050324 54 0.37293540620806759 58 0.25360091301142923
		3 54 0.19238765170021843 58 0.6999254149936236 59 0.10768693330615792
		3 54 0.03969685154791204 58 0.74163196762364192 59 0.21867118082844611
		3 54 0.81457393002408296 55 0.087058160017908282 58 0.098367909958008662
		3 53 0.11411299284373509 54 0.61634982989413301 58 0.26953717726213194
		3 50 0.19597024508228375 54 0.68569372049977872 55 0.11833603441793761
		3 49 0.063639539119370037 50 0.38679140112285337 54 0.54956905975777659
		3 53 0.27818935978387987 54 0.41243699962787539 58 0.30937364058824468
		3 53 0.18436060367355464 54 0.42457660192259633 58 0.39106279440384911
		3 53 0.13383677748873613 54 0.36595531344872517 58 0.50020790906253876
		3 53 0.14888488107869766 54 0.40017037958241364 58 0.45094473933888873
		3 53 0.21706794172732161 54 0.36603432565441696 58 0.41689773261826135
		3 41 0.31937279522270717 45 0.46265000547961821 49 0.21797719929767451
		3 41 0.34056956472577149 45 0.55347144577424445 49 0.10595898949998399
		3 41 0.34997042580100263 45 0.51795933232968316 49 0.13207024186931415
		3 41 0.42819581217489117 45 0.32333279729045045 49 0.24847139053465844
		3 41 0.28272596816869278 45 0.26161302808085213 49 0.45566100375045504
		3 41 0.34666993333695906 45 0.29480572253138837 49 0.35852434413165246
		3 41 0.24324950470708162 49 0.53141010688975343 53 0.22534038840316503
		3 41 0.27611634821471515 49 0.34192867296965024 53 0.38195497881563456
		3 41 0.26817477960202629 49 0.2368134434574031 53 0.49501177694057052
		3 41 0.34878625494436455 53 0.3924968831900989 57 0.25871686186553672
		3 41 0.32656006794124437 53 0.21317518376298636 57 0.4602647482957693
		3 41 0.42992018249196023 57 0.48486549782937099 58 0.085214319678668826
		3 41 0.37376348894294104 53 0.15570234015178788 57 0.470534170905271
		3 41 0.26964998357174086 49 0.27517241582590235 53 0.45517760060235674
		3 41 0.24753226601596526 49 0.40451948743905042 53 0.34794824654498435
		3 41 0.43517703525608947 53 0.31961671847731787 57 0.24520624626659263
		3 49 0.087218935259246483 50 0.75150868632491519 54 0.16127237841583839
		3 50 0.77436168906726743 51 0.18005954625515189 54 0.045578764677580576
		3 49 0.1568262521458085 50 0.35073386799168355 54 0.49243987986250798
		3 49 0.10691759829634377 50 0.53635808503938587 54 0.3567243166642704
		3 49 0.088817169653679515 50 0.60780733814282384 54 0.30337549220349663
		3 49 0.11305174887739333 50 0.55710098282907627 54 0.32984726829353034
		3 49 0.22339325693262657 50 0.52784103115948411 54 0.24876571190788924
		3 46 0.025976826504232473 50 0.82425094026833101 51 0.14977223322743649
		3 45 0.098172749097083692 46 0.16747319013425999 50 0.73435406076865639
		3 45 0.068223950364539071 46 0.86113896487934749 47 0.070637084756113355
		3 45 0.1404932793473738 46 0.68678265727216559 50 0.17272406338046067
		3 45 0.24160466821868637 46 0.34094160916324351 50 0.41745372261807007
		3 45 0.15724935483073052 46 0.44665336302693187 50 0.39609728214233747
		3 45 0.16271542537818937 46 0.40575710748361504 50 0.43152746713819556
		3 45 0.18300785443006209 46 0.37897794092856618 50 0.43801420464137175
		3 45 0.27539156818478228 46 0.41327002136138979 50 0.31133841045382793
		3 41 0.38908912960501552 49 0.32646846702579257 53 0.28444240336919191
		3 41 0.42863619252237384 49 0.25550749977973908 53 0.31585630769788708
		3 50 0.32160350092251622 51 0.64521527248045152 52 0.033181226597032092
		3 50 0.42699323639071712 51 0.55178299236772843 52 0.021223771241554376
		3 50 0.44478143073109416 51 0.53295278815092517 52 0.02226578111798062
		3 50 0.41288312348961043 51 0.57091256786145606 52 0.016204308648933692
		3 50 0.38840396829845319 51 0.58862384912130028 52 0.022972182580246477
		3 50 0.27961182939629675 51 0.68015746586606307 52 0.040230704737640094
		3 50 0.18263182926629562 51 0.74968524957003602 52 0.067682921163668391
		3 50 0.40225386779863426 51 0.57429720719735522 52 0.023448925004010534
		3 50 0.092268019357418102 51 0.77546112579004911 52 0.13227085485253284
		3 50 0.16326785049369064 51 0.75101749564109621 52 0.085714653865213097
		3 50 0.22070315154751727 51 0.72014496564729913 52 0.059151882805183409
		3 50 0.1762576916796714 51 0.74531255811585106 52 0.078429750204477636
		3 50 0.12306233326964014 51 0.77653129683515998 52 0.10040636989520003
		3 50 0.073143232472297343 51 0.79036946726135215 52 0.13648730026635048
		3 50 0.035431363629134613 51 0.76534445501416881 52 0.19922418135669656
		3 50 0.18018576761829133 51 0.74150448575358885 52 0.078309746628119861
		3 50 0.0016674134307748626 51 0.5106572608079607 52 0.48767532576126438
		3 50 0.0016531447281255655 51 0.51852066958851517 52 0.47982618568335933
		3 50 0.0018313560117589362 51 0.54041146572578924 52 0.45775717826245194
		3 50 0.00086442466882824553 51 0.52897540108144425 52 0.47016017424972761
		3 50 0.0010686336200469264 51 0.518313604210485 52 0.480617762169468
		3 50 0.0013170932965549998 51 0.51069737799115444 52 0.48798552871229045
		3 50 0.001817170987747585 51 0.5111519245056606 52 0.48703090450659192
		3 50 0.00099567589955748396 51 0.53236280778587541 52 0.46664151631456707
		3 50 0.0019740363919730874 51 0.56433058909932232 52 0.43369537450870477
		3 50 0.0011816715557688014 51 0.5661587346779311 52 0.43265959376630009
		3 50 0.0010488304499873646 51 0.56133295838039887 52 0.43761821116961369
		3 50 0.001698205295992487 51 0.60742900985063786 52 0.39087278485336968
		3 50 0.0033039137790905481 51 0.62659792720303364 52 0.37009815901787574
		3 50 0.0051955017816198053 51 0.63620833090381523 52 0.35859616731456501
		3 50 0.012148777222960294 51 0.66755389080535998 52 0.32029733197167981
		3 50 0.0056043355890649143 51 0.59972245910004363 52 0.39467320531089145
		3 50 0.0034118997726274116 51 0.49829405011368633 52 0.49829405011368633
		3 50 0.0030223292337609019 51 0.4984888353831195 52 0.4984888353831195
		3 50 0.0023419077813297408 51 0.49882904610933515 52 0.49882904610933515
		3 50 0.002569147964012967 51 0.49871542601799351 52 0.49871542601799351
		3 50 0.0031952323286416839 51 0.49840238383567914 52 0.49840238383567914
		3 50 0.003287559055743215 51 0.49835622047212841 52 0.49835622047212841
		3 50 0.0028115769536517783 51 0.49859421152317412 52 0.49859421152317412
		3 50 0.0024354875173773073 51 0.49878225624131134 52 0.49878225624131134
		3 50 0.0019533576110778088 51 0.49902332119446108 52 0.49902332119446108
		3 50 0.014192744406389507 51 0.68447274708353245 52 0.30133450851007804
		3 50 0.0038005837251129599 51 0.64839940124290929 52 0.34780001503197783
		3 50 0.007510992787930707 51 0.68384493065616092 52 0.30864407655590842
		3 50 0.020080786440339695 51 0.73592399065455261 52 0.24399522290510756
		3 50 0.033889079267708538 51 0.74560724466262751 52 0.2205036760696639
		3 50 0.04397527053878706 51 0.75247558619580701 52 0.20354914326540596
		3 50 0.070542445464489373 51 0.76946380399584191 52 0.15999375053966872
		3 50 0.03671811748456634 51 0.72995311213811664 52 0.23332877037731703
		3 49 0.013633943658753011 50 0.67378407570155563 51 0.31258198063969134
		3 50 0.5142799824256935 51 0.47376389321087853 52 0.011956124363427948
		3 49 0.016053182224161022 50 0.60902424098510899 51 0.37492257679072993
		3 49 0.022573196778128718 50 0.70699453710869442 51 0.27043226611317706
		3 49 0.012022362749878591 50 0.66456272793365923 51 0.32341490931646222;
	setAttr ".wl[1500:1666].w"
		3 49 0.0057279222152731984 50 0.65703033176989911 51 0.33724174601482759
		3 49 0.0090898115266195914 50 0.73003521360271517 51 0.26087497487066524
		3 49 0.019928863921115529 50 0.76121206845391143 51 0.21885906762497301
		3 50 0.0023033358397863942 51 0.50143843792661213 52 0.49625822623360155
		3 50 0.002631953959357836 51 0.49987772492134647 52 0.4974903211192957
		3 50 0.0029517368406697742 51 0.4992229964646081 52 0.49782526669472232
		3 50 0.0019903390139699695 51 0.5012230585649694 52 0.49678660242106076
		3 50 0.0017930723647936963 51 0.50024958006435272 52 0.49795734757085358
		3 50 0.0012419455383993765 51 0.50268984878444778 52 0.49606820567715282
		3 50 0.0015542173028068574 51 0.50222066280726474 52 0.4962251198899284
		3 50 0.0017061198771105449 51 0.50410201893379281 52 0.49419186118909669
		3 46 0.005747225787037266 47 0.51153901577194749 48 0.48271375844101538
		3 46 0.0065704577688902163 47 0.50005110801448516 48 0.49337843421662464
		3 46 0.0067813677733017533 47 0.49814852839601731 48 0.49507010383068073
		3 46 0.0060095209883111716 47 0.52589350781766675 48 0.46809697119402205
		3 46 0.0038710705796626281 47 0.52913725222845276 48 0.46699167719188461
		3 46 0.0036533229178889082 47 0.53921206084385842 48 0.45713461623825286
		3 46 0.0067495797397004896 47 0.50099763353349291 48 0.49225278672680667
		3 46 0.0047605068254389553 47 0.52126195628465455 48 0.47397753688990651
		3 46 0.005450635449158265 47 0.49926128161162742 48 0.49528808293921434
		3 46 0.0057284317553698656 47 0.49713578412231507 48 0.49713578412231507
		3 46 0.0058822666670161712 47 0.49705886949365546 48 0.49705886383932824
		3 46 0.0053742529951554497 47 0.49940006542904058 48 0.49522568157580388
		3 46 0.0059769582771985481 47 0.49701152371269636 48 0.49701151801010496
		3 46 0.0061301921222044354 47 0.49693490955034225 48 0.49693489832745313
		3 46 0.0046544246625217084 47 0.50337749852049796 48 0.49196807681698029
		3 46 0.0046835703367894528 47 0.50031093343844879 48 0.49500549622476181
		3 46 0.0049310212572362842 47 0.50101224147188217 48 0.49405673727088151
		3 45 0.028384024716201411 46 0.81819443066046238 47 0.1534215446233364
		3 45 0.027730562109820858 46 0.78850859193133016 47 0.18376084595884917
		3 45 0.017717307665741807 46 0.70772064625042996 47 0.27456204608382823
		3 45 0.029605891404804383 46 0.73453277299060882 47 0.23586133560458669
		3 45 0.032192009232472847 46 0.73481259464269788 47 0.2329953961248292
		3 45 0.028087603802307324 46 0.75868705958286209 47 0.21322533661483056
		3 45 0.022491636228616024 46 0.80711475383195808 47 0.17039360993942593
		3 45 0.028491770012758738 46 0.86526109965340459 47 0.10624713033383663
		3 46 0.64329633357959415 47 0.33731240918158678 48 0.019391257238819095
		3 46 0.63021394427156341 47 0.34213610906251402 48 0.02764994666592251
		3 46 0.54130014483723965 47 0.41913940960643564 48 0.039560445556324791
		3 46 0.48956854261242672 47 0.47336030413552727 48 0.037071153252045935
		3 46 0.47433236589274136 47 0.49430942455182014 48 0.031358209555438527
		3 46 0.47895862570111591 47 0.490821699205432 48 0.030219675093452154
		3 46 0.45465515810645085 47 0.51745030224350508 48 0.027894539650043949
		3 46 0.57178378342816405 47 0.41003488171162977 48 0.018181334860206139
		3 46 0.39188130696723023 47 0.56675207933700655 48 0.041366613695763339
		3 46 0.32672751578233344 47 0.59427962637169374 48 0.078992857845972958
		3 46 0.26531788368340825 47 0.62580268940880091 48 0.1088794269077909
		3 46 0.23023093741199893 47 0.65900756523566173 48 0.11076149735233935
		3 46 0.23225709164669558 47 0.66361418181723775 48 0.10412872653606664
		3 46 0.25702328245598893 47 0.65548321144614097 48 0.08749350609787003
		3 46 0.26806953545392503 47 0.67233225536289498 48 0.059598209183180095
		3 46 0.34053485265032074 47 0.62521865846368185 48 0.034246488885997531
		3 46 0.15371840045353277 47 0.73270083022875199 48 0.11358076931771535
		3 46 0.12160156924091618 47 0.69141245598053391 48 0.18698597477854989
		3 46 0.092859100426367414 47 0.66972675238761559 48 0.237414147186017
		3 46 0.081133719550951555 47 0.67664491452241826 48 0.24222136592663024
		3 46 0.095113724939402969 47 0.68416799016597063 48 0.22071828489462642
		3 46 0.12285541112829612 47 0.71727727381004436 48 0.15986731506165949
		3 46 0.15115727367984019 47 0.75332516060773924 48 0.095517565712420566
		3 46 0.16697188540768185 47 0.75570178761317774 48 0.077326326979140408
		3 46 0.045304624890866889 47 0.69947949471681203 48 0.25521588039232113
		3 46 0.038733967839935123 47 0.62497418160469087 48 0.33629185055537403
		3 46 0.031483520548717836 47 0.59281605041756869 48 0.37570042903371337
		3 46 0.031303651231904983 47 0.59824398741821749 48 0.37045236134987758
		3 46 0.040591726975081031 47 0.63929493127543768 48 0.32011334174948131
		3 46 0.049608930262544204 47 0.71125964741683589 48 0.23913142232061996
		3 46 0.052097505598895283 47 0.75797055546728609 48 0.18993193893381863
		3 46 0.049695950870236844 47 0.75533251704673232 48 0.19497153208303086
		3 46 0.011773207845059568 47 0.57053907178633034 48 0.41768772036861002
		3 46 0.012762895412168705 47 0.53064655220347012 48 0.45659055238436103
		3 46 0.012001444745688546 47 0.51706943718556897 48 0.47092911806874233
		3 46 0.013342010834903667 47 0.53517973215994263 48 0.45147825700515376
		3 46 0.014684012142886187 47 0.58642971472854133 48 0.39888627312857244
		3 46 0.010880404680492404 47 0.61797391970632631 48 0.37114567561318129
		3 46 0.0089379527937104592 47 0.6335237275784058 48 0.35753831962788385
		3 46 0.0097373532274231765 47 0.61608323866110437 48 0.37417940811147243
		3 54 0.006771262483974751 55 0.73299951293404475 56 0.26022922458198039
		3 54 0.0048525780147296374 55 0.61912605330345971 56 0.37602136868181063
		3 54 0.003672662816834581 55 0.53358396574500855 56 0.46274337143815697
		3 54 0.0060455283458765779 55 0.57889923013081601 56 0.41505524152330742
		3 54 0.0054992578882246644 55 0.6482227118798628 56 0.3462780302319125
		3 54 0.010110195457845699 55 0.78129413885222521 56 0.2085956656899291
		3 54 0.0074421814713919203 55 0.78464678029274226 56 0.20791103823586585
		3 54 0.0028069484785259394 55 0.51902699993216261 56 0.47816605158931141
		3 54 0.0036575431240727626 55 0.6974225937137104 56 0.29891986316221691
		3 54 0.0024186258336697641 55 0.58813918069379867 56 0.40944219347253163
		3 54 0.0019849803404670763 55 0.5247096337907724 56 0.47330538586876048
		3 54 0.003332047106552923 55 0.68388139573552842 56 0.31278655715791859
		3 54 0.0023192715725255356 55 0.57787450650784278 56 0.41980622191963157
		3 54 0.0019993886667679104 55 0.52815862726865037 56 0.46984198406458172
		3 54 0.004663259355598027 55 0.71542589278081914 56 0.27991084786358278
		3 54 0.003211684687967968 55 0.62430960445511807 56 0.37247871085691392
		3 54 0.0025882567458371929 55 0.55442150680992996 56 0.44299023644423291
		3 54 0.76273768697431943 55 0.20438205051994326 58 0.03288026250573732
		3 54 0.73512295502421998 55 0.24215789165845986 58 0.022719153317320086
		3 54 0.84386817694098915 55 0.12196986448697886 58 0.03416195857203197
		3 50 0.041957786665935248 54 0.78847575103930201 55 0.16956646229476283
		3 50 0.086156022067618951 54 0.70792311773774907 55 0.20592086019463193
		3 50 0.07798692135699771 54 0.64448966728859569 55 0.27752341135440672
		3 50 0.09385985788416279 54 0.68680020835186673 55 0.21933993376397051
		3 50 0.055076481612001398 54 0.79148173084734985 55 0.15344178754064883
		3 54 0.54617162404923991 55 0.44204340315044616 56 0.011784972800313862
		3 50 0.018608868210894264 54 0.61585124007547953 55 0.36553989171362611
		3 50 0.024779145294879724 54 0.53471675686301912 55 0.44050409784210115
		3 50 0.014631050175282812 54 0.50695846221084184 55 0.47841048761387533
		3 50 0.023433401352182841 54 0.57570897798585563 55 0.40085762066196157
		3 50 0.015076348672792369 54 0.60294993369969196 55 0.3819737176275157
		3 54 0.66174615340029785 55 0.33123156504959589 56 0.0070222815501062774
		3 54 0.48638691272811035 55 0.49821423995150566 56 0.015398847320384009
		3 54 0.30766365554002623 55 0.66372116210418253 56 0.028615182355791257
		3 54 0.39541711662236029 55 0.58547401180261616 56 0.019108871575023709
		3 54 0.35656479907734828 55 0.61191152351904876 56 0.031523677403602894
		3 54 0.32365722140205172 55 0.61520248990313797 56 0.061140288694810196
		3 54 0.40262851687449797 55 0.57042892374635401 56 0.026942559379147944
		3 54 0.40627017790991954 55 0.57615228374970362 56 0.017577538340376831
		3 54 0.41464291009750137 55 0.56715086460570929 56 0.018206225296789308
		3 54 0.25043322813609797 55 0.71571359029795611 56 0.033853181565945842
		3 54 0.14806623229368934 55 0.80158388247658785 56 0.050349885229722856
		3 54 0.19190229881111243 55 0.74689404918650604 56 0.061203652002381495
		3 54 0.19098064297755157 55 0.68918369361816478 56 0.11983566340428362
		3 54 0.15026943980832383 55 0.65269560141638117 56 0.197034958775295
		3 54 0.21342193183043462 55 0.67799436341974861 56 0.10858370474981664
		3 54 0.24955332847647008 55 0.70097916030943652 56 0.049467511214093457
		3 54 0.18455207896514597 55 0.76776713033004595 56 0.04768079070480815
		3 54 0.11314990007615271 55 0.83351018525420695 56 0.053339914669640331
		3 54 0.067670256293575745 55 0.84680554462921798 56 0.085524199077206223
		3 54 0.077331025104633591 55 0.75784672974185119 56 0.16482224515351515
		3 54 0.072034191286885679 55 0.64950086401390572 56 0.27846494469920852
		3 54 0.050561868496431704 55 0.59621981896985143 56 0.35321831253371688
		3 54 0.068697170245043751 55 0.65976619486037302 56 0.27153663489458318
		3 54 0.11025731923699987 55 0.7646060250410972 56 0.12513665572190294
		3 54 0.058475888002267835 55 0.84411274253810686 56 0.097411369459625322
		3 54 0.067193704013217143 55 0.8671109566755022 56 0.065695339311280715
		3 54 0.024209793753361464 55 0.80864864683554749 56 0.16714155941109102
		3 54 0.023212689245714346 55 0.68481565165596947 56 0.29197165909831629
		3 54 0.017953973855965345 55 0.57387184391380042 56 0.40817418223023416
		3 54 0.014843897767396112 55 0.55381553764407965 56 0.4313405645885241
		3 54 0.018902218331953033 55 0.6202990287292981 56 0.3607987529387488
		3 54 0.027057341472023825 55 0.73247576445649376 56 0.24046689407148247
		3 54 0.022826265333390772 55 0.84377821247896512 56 0.13339552218764408
		3 54 0.0267466866431923 55 0.86384027601402524 56 0.10941303734278252
		3 58 0.0040890319339352277 59 0.50183857817986222 60 0.49407238988620239
		3 58 0.0041174917558345469 59 0.50074241154175636 60 0.49514009670240905
		3 58 0.0045850895522263633 59 0.49958242618827908 60 0.4958324842594945
		3 58 0.0060600260217458261 59 0.50761955972900275 60 0.48632041424925143
		3 58 0.0063493101989930602 59 0.51441481141894063 60 0.47923587838206627
		3 58 0.0068324450282162439 59 0.52583649839761837 60 0.46733105657416529
		3 58 0.0043495288170130701 59 0.50336346458512182 60 0.49228700659786512
		3 58 0.0050569168712948365 59 0.50049122092993992 60 0.49445186219876519
		3 58 0.0036556058776538868 59 0.49817219706117305 60 0.49817219706117305
		3 58 0.0040159922806648953 59 0.49799200385966758 60 0.49799200385966758
		3 58 0.0045760052324040441 59 0.49771199738379801 60 0.49771199738379801
		3 58 0.0035281026555674362 59 0.49823594867221627 60 0.49823594867221627
		3 58 0.0036265378874570714 59 0.49818673105627148 60 0.49818673105627148
		3 58 0.0041978716560988252 59 0.49790106417195062 60 0.49790106417195062
		3 58 0.0044020380709882271 59 0.50056489376244373 60 0.49503306816656811
		3 58 0.0046925373176266924 59 0.4991339415465762 60 0.49617352113579727
		3 58 0.0050063344210873485 59 0.49894745398494239 60 0.49604621159397028
		3 57 0.038508733482586419 58 0.69759412204705951 59 0.26389714447035417
		3 57 0.023043730197911307 58 0.7833687530960981 59 0.19358751670599048
		3 57 0.013564248983655732 58 0.8451330869435093 59 0.14130266407283507
		3 54 0.010808721786929015 58 0.74826177794525162 59 0.2409295002678194
		3 54 0.011759835255225361 58 0.68254340253207546 59 0.30569676221269909
		3 58 0.58602018495477703 59 0.39863674532914845 60 0.015343069716074426
		3 57 0.019855985754066864 58 0.61440591959593793 59 0.36573809464999513
		3 57 0.037583752693767493 58 0.62864674714072588 59 0.33376950016550672
		2 58 0.40353312818944687 59 0.56235569709941002;
	setAttr ".wl[1666:1833].w"
		1 60 0.034111174711143222
		3 58 0.36280988366024353 59 0.59923284611412764 60 0.037957270225628885
		3 58 0.36774091669471082 59 0.59426557213170816 60 0.037993511173581178
		3 58 0.33484521333353429 59 0.62174970015254227 60 0.043405086513923309
		3 58 0.43877904724407835 59 0.534020549072172 60 0.027200403683749558
		3 58 0.49974047499205027 59 0.47885273847026333 60 0.02140678653768651
		3 58 0.61159397024224393 59 0.37412060586555507 60 0.014285423892200912
		3 58 0.49455578304070275 59 0.48053108130206912 60 0.02491313565722816
		3 58 0.18065333947441606 59 0.73066818263775812 60 0.088678477887825735
		3 58 0.17482104071293697 59 0.72865464623982856 60 0.096524313047234453
		3 58 0.18280322746703837 59 0.71709193177326991 60 0.10010484075969177
		3 58 0.15183234688887226 59 0.73346538023837393 60 0.11470227287275377
		3 58 0.2190498000455631 59 0.70963504992312576 60 0.071315150031311156
		3 58 0.25897703452518217 59 0.6821892611993825 60 0.058833704275435231
		3 58 0.33291818984713611 59 0.62278609880731095 60 0.044295711345553108
		3 58 0.22956490994487294 59 0.7005550191906843 60 0.069880070864442881
		3 58 0.069994681624655594 59 0.72258378737449114 60 0.20742153100085317
		3 58 0.072016836076421925 59 0.70764611553377454 60 0.22033704838980361
		3 58 0.071125086994142508 59 0.70220639310477284 60 0.22666851990108469
		3 58 0.052772953662593984 59 0.70151865661015522 60 0.2457083897272507
		3 58 0.083786724630979192 59 0.75305167504817971 60 0.16316160032084115
		3 58 0.10172649248728113 59 0.76396818578721826 60 0.13430532172550058
		3 58 0.13312738041912991 59 0.7547930195417123 60 0.11207960003915775
		3 58 0.083659904801902718 59 0.74701230331246582 60 0.16932779188563149
		3 58 0.024516266758643282 59 0.61567544639526961 60 0.35980828684608712
		3 58 0.023963353270998758 59 0.60672202535622477 60 0.36931462137277654
		3 58 0.021641794508260398 59 0.60420611473999186 60 0.37415209075174771
		3 58 0.016557899325930912 59 0.59482053854590311 60 0.38862156212816584
		3 58 0.028703131827425007 59 0.6683927303988173 60 0.30290413777375763
		3 58 0.03602281815954754 59 0.70760624720665533 60 0.25637093463379718
		3 58 0.04544055304792495 59 0.72401946261675898 60 0.23053998433531611
		3 58 0.028785800411607502 59 0.6531560817473685 60 0.31805811784102389
		3 58 0.0081001270279170336 59 0.53171554623115491 60 0.46018432674092818
		3 58 0.0076682790004322628 59 0.52937440840630445 60 0.46295731259326312
		3 58 0.0071146637580050149 59 0.52450020221178506 60 0.46838513403021004
		3 58 0.0073784744691934362 59 0.52563180088447037 60 0.4669897246463362
		3 58 0.011183087381932886 59 0.56120918937530018 60 0.4276077232427668
		3 58 0.01436675296602586 59 0.59600809489391693 60 0.38962515214005733
		3 58 0.016837652317321615 59 0.61494918844531898 60 0.36821315923735942
		3 58 0.010028340589462123 59 0.55032252093712242 60 0.43964913847341536
		3 15 0.80534741709992996 16 0.19453468631371246 17 0.000117896586357608
		3 15 0.88759107482071309 16 0.11234757344957862 17 6.1351729708248635e-05
		3 15 0.90432435667703992 16 0.095601199726866079 17 7.4443596094131648e-05
		3 15 0.9061591321878667 16 0.093763169231468269 17 7.7698580665024487e-05
		3 15 0.92971952626128351 16 0.070218887845586025 17 6.1585893130562414e-05
		3 15 0.94895716683891251 16 0.050982873372162077 17 5.9959788925392807e-05
		3 15 0.90952010194890576 16 0.090387237170092533 17 9.266088100170751e-05
		3 15 0.8762400740898808 16 0.12358830377403528 17 0.0001716221360839679
		3 15 0.86235475105430359 16 0.13742456327428984 17 0.00022068567140668026
		3 15 0.86115672752603389 16 0.13868664539090048 17 0.000156627083065515
		3 15 0.85895075846320645 16 0.14093817665149003 17 0.00011106488530353566
		3 15 0.84845404846588057 16 0.15142152487800803 17 0.000124426656111425
		3 40 0.81499787673313917 41 0.18485750629083655 42 0.00014461697602439377
		3 40 0.89183325917822953 41 0.10810134144168419 42 6.5399380086266648e-05
		3 40 0.9032989105787772 41 0.096624002266633008 42 7.7087154589747472e-05
		3 40 0.89853780704152586 41 0.10136182942840033 42 0.00010036353007384376
		3 40 0.91749668945740248 41 0.082400366754438195 42 0.00010294378815917606
		3 40 0.93681229091328311 41 0.06308776175348417 42 9.99473332326644e-05
		3 40 0.9017890605172747 41 0.098040872541271057 42 0.0001700669414542818
		3 40 0.87756129609667544 41 0.12212892808090674 42 0.00030977582241792655
		3 40 0.86086210988926704 41 0.13876995312672805 42 0.00036793698400493555
		3 40 0.8444691717877324 41 0.15528028827350074 42 0.00025053993876681887
		3 40 0.83686898382955277 41 0.16294744532346214 42 0.00018357084698494399
		3 40 0.84053774880491261 41 0.1592724046220842 42 0.00018984657300337643
		3 40 0.34242810548127695 41 0.64845261110531494 42 0.0091192834134081382
		3 40 0.43056751996813414 41 0.56305559576479725 42 0.0063768842670685237
		3 40 0.31631273953164674 41 0.66860859054462474 42 0.015078669923728341
		3 40 0.26591529065176978 41 0.71294575218678369 42 0.021138957161446488
		3 40 0.33297330286097376 41 0.66115423056116351 42 0.0058724665778626872
		3 40 0.31605704991012024 41 0.6806431419975999 42 0.0032998080922799745
		3 40 0.32622571304937475 41 0.67275026214963429 42 0.0010240248009908014
		3 40 0.29369845898604363 41 0.70558747266834931 57 0.00071406834560710012
		3 40 0.27774235155662175 41 0.72186502301239319 57 0.00039262543098504286
		3 40 0.38218137208751973 41 0.61759688169722526 42 0.00022174621525508973
		3 40 0.36557495793719447 41 0.63359765756763742 42 0.00082738449516810782
		3 40 0.31175901171342196 41 0.68198369992872354 42 0.0062572883578544342
		3 15 0.017007335470647835 16 0.86217184106861022 17 0.12082082346074188
		3 15 0.097235188744518503 16 0.86356057467728919 17 0.039204236578192268
		3 15 0.079937560524265622 16 0.87872370126420229 17 0.041338738211532208
		3 15 0.009694445259904828 16 0.85764796495983475 17 0.13265758978026038
		3 16 0.74771049619547614 17 0.23041229976429026 18 0.021877204040233529
		3 15 0.050447224208275993 16 0.8624876530632023 17 0.087065122728521585
		3 16 0.67780959243441108 17 0.24000453195071669 18 0.082185875614872214
		3 16 0.36318167622081249 17 0.45865460806326619 18 0.17816371571592135
		3 16 0.57505483902896271 17 0.35483471478120038 18 0.070110446189836889
		3 16 0.78498771851214644 17 0.18162960585623994 18 0.033382675631613533
		3 16 0.27667007754621992 17 0.45625879497392408 18 0.26707112747985595
		3 16 0.54137545284910715 17 0.2960897608599129 18 0.16253478629097984
		3 16 0.71885405033420013 17 0.15920491289214928 20 0.12194103677365051
		3 16 0.50271424762270711 17 0.34041087991054175 18 0.15687487246675122
		3 16 0.38915658205229375 17 0.3741015696614215 18 0.23674184828628464
		3 16 0.65230005576200345 17 0.20996281618872634 20 0.13773712804927032
		3 15 0.014655413666707872 16 0.88489655301348547 17 0.10044803331980665
		3 15 0.12262903931015245 16 0.84735621249936044 17 0.030014748190487068
		3 16 0.6020420069166621 17 0.31661366652670947 18 0.081344326556628488
		3 16 0.82025816251139738 17 0.10741863886269508 20 0.07232319862590765
		3 15 0.070879816426090064 16 0.89343842411521002 17 0.035681759458699946
		3 15 0.015023581507257381 16 0.85869761897473895 17 0.12627879951800372
		3 16 0.72928021854899139 17 0.23616909234487771 18 0.034550689106130919
		3 15 0.017626758724752049 16 0.91637265361742959 17 0.066000587657818313
		3 16 0.81968642334984676 28 0.023162812642214918 32 0.15715076400793829
		3 16 0.59738573114192972 32 0.33278395036378178 33 0.069830318494288571
		3 16 0.56948340989479951 32 0.34362674233074086 33 0.086889847774459461
		3 16 0.77945167010425365 28 0.023341789054944013 32 0.19720654084080244
		3 16 0.7876932692481583 32 0.19334499799572927 33 0.018961732756112369
		3 16 0.60813526014206654 32 0.34009500548808924 33 0.051769734369844209
		3 16 0.78540313221159774 20 0.16823814367523163 28 0.04635872411317056
		3 16 0.83708175485153358 20 0.081153005635919664 28 0.081765239512546897
		3 16 0.7825878705462801 28 0.067273538875927061 32 0.15013859057779286
		3 16 0.60134138780660307 20 0.25469930769313343 28 0.1439593045002634
		3 16 0.68287101034603226 28 0.17673639618725914 32 0.14039259346670868
		3 16 0.53911946426453905 28 0.14808887194277182 32 0.3127916637926893
		3 16 0.67572412983119123 17 0.10794725857273758 20 0.21632861159607139
		3 16 0.68144457506702028 17 0.064262402508865682 20 0.25429302242411406
		3 16 0.7223687478536327 17 0.041788708730470962 20 0.23584254341589631
		3 16 0.53661542883952562 20 0.33296701107046672 24 0.13041756009000768
		3 16 0.52675342709747974 20 0.39847013815455717 24 0.074776434747963041
		3 16 0.54791758128193779 20 0.37966046516096108 24 0.072421953557101043
		3 16 0.89556378773455891 17 0.030082449943017821 32 0.074353762322423342
		3 16 0.84811690674334306 17 0.095907413958097765 32 0.055975679298559053
		3 16 0.77447176738958268 28 0.054582836805984303 32 0.17094539580443299
		3 16 0.78235038142191338 28 0.10194042509394656 32 0.11570919348414015
		3 16 0.746131047536436 17 0.12602364065945795 20 0.12784531180410608
		3 16 0.59692829526021185 28 0.13491613927006824 32 0.26815556546971991
		3 16 0.63144218429569243 28 0.22206584219574099 32 0.14649197350856655
		3 16 0.60184950091478151 20 0.21725794496435766 28 0.18089255412086083
		3 15 0.040541846978193609 16 0.93704005257464007 32 0.022418100447166248
		3 15 0.037183387750516078 16 0.89799793237437731 17 0.064818679875106783
		3 15 0.1449978973291082 16 0.83711477337665074 17 0.017887329294241007
		3 15 0.15557556953490637 16 0.81577756938344448 17 0.028646861081649194
		3 15 0.11430085069275152 16 0.88178298934135546 32 0.003916159965893065
		3 15 0.10233197346427379 16 0.89262469129999222 32 0.0050433352357339267
		3 15 0.12302181928848462 16 0.87148467154137432 32 0.0054935091701409549
		3 15 0.03708606563105564 16 0.94640413528921896 32 0.016509799079725409
		3 15 0.039004651907511748 16 0.94141070978385133 32 0.01958463830863702
		3 15 0.030648941970218797 16 0.94448551164198968 32 0.024865546387791558
		3 15 0.11229738878032047 16 0.87567143255785218 17 0.012031178661827431
		3 15 0.13897449018076202 16 0.85889256487154275 28 0.0021329449476952837
		3 15 0.03548011393528705 16 0.95227330110044395 17 0.012246584964268935
		3 15 0.036721218938043018 16 0.95318550483309206 32 0.010093276228864941
		3 16 0.48665637974744819 17 0.47574380101637964 18 0.037599819236172186
		3 16 0.27804985215517725 17 0.60541619061289143 18 0.1165339572319313
		3 16 0.26128457126296095 17 0.6340759113642408 18 0.1046395173727982
		3 16 0.53687558459577711 17 0.43252623881640545 18 0.030598176587817435
		3 16 0.58606082176456187 17 0.39449578997127288 18 0.019443388264165216
		3 16 0.37669356613176369 17 0.55545407924537682 18 0.067852354622859559
		3 16 0.18888986741674063 17 0.63838144538258679 18 0.17272868720067247
		3 16 0.3572741799147352 17 0.5653131880061546 18 0.077412632079110172
		3 16 0.11583318793857307 17 0.64180402138952375 18 0.24236279067190314
		3 16 0.047815831660956702 17 0.61368092964815946 18 0.33850323869088389
		3 16 0.10753845261351884 17 0.64563553598091938 18 0.24682601140556185
		3 16 0.22424551892638483 17 0.62667051982774469 18 0.14908396124587042
		3 17 0.53400915262062365 18 0.42095021555742035 19 0.04504063182195598
		3 16 0.063588198912682525 17 0.59753578015820719 18 0.33887602092911018
		3 16 0.12056914494957523 17 0.52737697178972021 18 0.35205388326070458
		3 16 0.046710770073683155 17 0.50212328106449011 18 0.45116594886182665
		3 17 0.51071522278395642 18 0.45001036072730638 19 0.039274416488737085
		3 16 0.071180440908591699 17 0.53781895658330237 18 0.39100060250810598
		3 16 0.07302967236177324 17 0.56285105548897474 18 0.3641192721492521
		3 16 0.16640582711656798 17 0.59809193389758808 18 0.23550223898584396
		3 16 0.36063580111047328 17 0.57564743266870488 18 0.063716766220821716
		3 16 0.15707057613674572 17 0.69386849309339294 18 0.14906093076986132
		3 16 0.1001875498569563 17 0.6623092801121595 18 0.23750317003088409
		3 16 0.2318192856947775 17 0.64383150501579234 18 0.12434920928943012
		3 16 0.93877119917968499 20 0.037829725709103139 28 0.023399075111211861
		3 16 0.92833233041685059 28 0.029724063972749942 32 0.04194360561039933
		3 16 0.91990972445598806 28 0.018231210888349132 32 0.061859064655662842
		1 16 0.91823138217483635;
	setAttr ".wl[1833:1999].w"
		2 28 0.0092614006780104546 32 0.072507217147153302
		3 16 0.90881175180149365 28 0.011013416620087917 32 0.080174831578418468
		3 17 0.14679206520621915 18 0.51781712892209308 19 0.33539080587168763
		3 17 0.23298773669739803 18 0.54469973838308583 19 0.22231252491951611
		3 17 0.19204248290528059 18 0.52852037911538197 19 0.27943713797933745
		3 17 0.22019772916687946 18 0.57997127335688925 19 0.19983099747623137
		3 17 0.26865352154659172 18 0.55473919526163484 19 0.17660728319177324
		3 17 0.31844136114548866 18 0.54170189101161625 19 0.13985674784289512
		3 17 0.1453441729403632 18 0.60374939943427408 19 0.25090642762536264
		3 17 0.082241994610513555 18 0.55256084245070358 19 0.36519716293878285
		3 17 0.10069212757333897 18 0.58698612722123178 19 0.31232174520542932
		3 17 0.07267894422121142 18 0.53367340162181509 19 0.39364765415697361
		3 17 0.10017698521344863 18 0.52033900764011343 19 0.37948400714643793
		3 17 0.056317346357785875 18 0.51804827379147256 19 0.4256343798507416
		3 17 0.015878212769640375 18 0.50699800728525324 19 0.47712377994510646
		3 17 0.025497909574694291 18 0.54450999545064849 19 0.42999209497465729
		3 17 0.040198653963831182 18 0.51540363716683957 19 0.44439770886932917
		3 17 0.018324513102768163 18 0.49514293303293783 19 0.48653255386429395
		3 17 0.018670190102118879 18 0.50208364187278409 19 0.4792461680250969
		3 17 0.045641680802397007 18 0.54035761859497256 19 0.41400070060263044
		3 17 0.01759539686760659 18 0.49295588893692421 19 0.48944871419546926
		3 17 0.033938345343827211 18 0.50127890835836231 19 0.46478274629781058
		3 17 0.022269938093012028 18 0.49168610261915607 19 0.48604395928783189
		3 17 0.018402110106250976 18 0.49079902346930582 19 0.49079886642444326
		3 17 0.017947328833544576 18 0.49125969738356207 19 0.49079297378289338
		3 17 0.026997467948616558 18 0.49401063844677545 19 0.47899189360460787
		3 17 0.01925196036765155 18 0.49037407663094451 19 0.49037396300140385
		3 17 0.019301830606311274 18 0.49166200016106171 19 0.48903616923262688
		3 17 0.015016913133881024 18 0.49379018179699086 19 0.49119290506912799
		3 17 0.015662793835943926 18 0.49216864857158121 19 0.49216855759247485
		3 17 0.019583417552414287 18 0.49020830785538227 19 0.49020827459220334
		3 17 0.016662960678123138 18 0.49202543106218399 19 0.49131160825969283
		3 17 0.01679214021621404 18 0.52200180717630063 19 0.46120605260748543
		3 17 0.01345216986140175 18 0.49829423689935842 19 0.48825359323923978
		3 17 0.013975642972247787 18 0.49301222777985315 19 0.49301212924789894
		3 17 0.01401940116138024 18 0.49599202446970519 19 0.48998857436891458
		3 17 0.014257833654667585 18 0.5035129642705839 19 0.48222920207474851
		3 17 0.013400670993315045 18 0.49397124274880927 19 0.49262808625787557
		3 17 0.019641717224318268 18 0.49017914138784086 19 0.49017914138784086
		3 17 0.023798201718566569 18 0.48810089914071675 19 0.48810089914071675
		3 17 0.023185352746877233 18 0.48840732362656136 19 0.48840732362656136
		3 17 0.019035527454745214 18 0.49048223627262744 19 0.49048223627262744
		3 17 0.023447112388211649 18 0.48827644380589419 19 0.48827644380589419
		3 17 0.023128058114714259 18 0.48843597227377594 19 0.48843596961150976
		3 17 0.018912307228881556 18 0.49069942975085806 19 0.4903882630202604
		3 17 0.019351475081968002 18 0.49097759208437719 19 0.48967093283365465
		3 17 0.016065641211322298 18 0.49339299907276218 19 0.49054135971591556
		3 17 0.016638478236146843 18 0.49183029306114545 19 0.49153122870270777
		3 17 0.019480887770279887 18 0.4902595571482099 19 0.49025955508151015
		3 17 0.020693452051205204 18 0.48965327833217714 19 0.4896532696166177
		3 17 0.014276364370842351 18 0.49404767205068656 19 0.49167596357847115
		3 17 0.015515704777793626 18 0.49224214761110319 19 0.49224214761110319
		3 17 0.016442637924914329 18 0.4917786810375428 19 0.4917786810375428
		3 17 0.083236993700082654 18 0.5928831146650716 19 0.3238798916348456
		3 17 0.15372012238850144 18 0.5792915488483168 19 0.26698832876318185
		3 17 0.12572671190746088 18 0.5524903940699053 19 0.32178289402263394
		3 17 0.10400579691375315 18 0.52887421298824167 19 0.36711999009800522
		3 17 0.078500261987595993 18 0.50992376657308691 19 0.41157597143931707
		3 17 0.053809837733876383 18 0.50113432536914249 19 0.44505583689698108
		3 17 0.035721814805128364 18 0.49962871225037769 19 0.46464947294449394
		3 17 0.022887778971222829 18 0.49680171540904527 19 0.48031050561973199
		3 17 0.025759034338026888 18 0.50440249208664589 19 0.46983847357532726
		3 17 0.027123932218085661 18 0.51513908234403771 19 0.45773698543787655
		3 17 0.03201601021680045 18 0.54229086090420153 19 0.42569312887899802
		3 17 0.047475608078378834 18 0.5801244734630433 19 0.37239991845857778
		3 17 0.4850229720671132 18 0.43766858191543956 19 0.07730844601744738
		3 17 0.41211195564226977 18 0.47758849943217968 19 0.11029954492555051
		3 17 0.36545449967954363 18 0.50403008107542424 19 0.1305154192450321
		3 17 0.37732611445377184 18 0.51385732376884097 19 0.10881656177738737
		3 17 0.41568273490136504 18 0.49114803530714601 19 0.093169229791488825
		3 17 0.51333415604659682 18 0.41233128450090073 19 0.074334559452502419
		3 16 0.057402413723614508 17 0.62000221579444825 18 0.32259537048193743
		3 16 0.098755331605510352 17 0.64534744284084056 18 0.25589722555364908
		3 16 0.17463104370566826 17 0.63094284174171766 18 0.19442611455261419
		3 16 0.11799114384038045 17 0.60413464741439205 18 0.27787420874522739
		3 16 0.071667441342107674 17 0.59098449329190494 18 0.33734806536598733
		3 17 0.55611318350597627 18 0.3935210834125088 19 0.05036573308151493
		3 16 0.76361900901203539 17 0.22700135384709463 18 0.0093796371408698485
		3 16 0.6556039795715779 17 0.31871033721183989 18 0.025685683216582111
		3 16 0.461278389332894 17 0.47008077904515266 18 0.06864083162195328
		3 16 0.34228710175728178 17 0.51194716048446409 18 0.14576573775825399
		3 16 0.26529080293071028 17 0.48027773542063901 18 0.25443146164865066
		3 16 0.17839928277953426 17 0.49209947903097501 18 0.32950123818949079
		3 16 0.14236956657048008 17 0.55243221564226697 18 0.30519821778725292
		3 16 0.1926052257849693 17 0.59371003047602711 18 0.21368474373900376
		3 16 0.37319871877011174 17 0.5214783839437056 18 0.10532289728618253
		3 16 0.55235796361467171 17 0.40852631410797091 18 0.039115722277357344
		3 16 0.69723924867575748 17 0.29003958101305555 18 0.012721170311186858
		3 16 0.7570929593155914 17 0.2358146339912732 18 0.0070924066931352982
		3 17 0.40281523407064118 18 0.49525022526328794 19 0.10193454066607088
		3 17 0.44609507890649552 18 0.47730896143851226 19 0.076595959654992343
		3 17 0.52320644186916399 18 0.41537846918138016 19 0.061415088949455833
		3 17 0.43002175322085939 18 0.46546178554758105 19 0.10451646123155954
		3 17 0.33943089671946591 18 0.51790446591754369 19 0.14266463736299057
		3 17 0.25736001811713782 18 0.55988043261347042 19 0.1827595492693917
		3 17 0.21181359613743045 18 0.56193766787410526 19 0.22624873598846418
		3 17 0.19463752240463589 18 0.54922808932713563 19 0.25613438826822843
		3 17 0.15951887359833378 18 0.53912300145775982 19 0.30135812494390646
		3 17 0.2414663546579065 18 0.52165741129280774 19 0.23687623404928576
		3 17 0.29903041246729534 18 0.50768840205651744 19 0.19328118547618725
		3 17 0.35384329603950998 18 0.5022219930019004 19 0.14393471095858965
		3 24 0.047233724264956804 25 0.74274742929887427 26 0.21001884643616886
		3 24 0.1214049437710794 25 0.80168874849415805 29 0.07690630773476255
		3 21 0.28009921058912512 24 0.096974923673491545 25 0.62292586573738329
		3 21 0.12701186248259011 25 0.69988938017069868 26 0.17309875734671124
		3 24 0.040392485701212767 25 0.74298556836577279 26 0.2166219459330144
		3 21 0.073111915545318221 24 0.1397801940471291 25 0.7871078904075528
		3 24 0.23921203489156501 25 0.64614148780807634 29 0.11464647730035864
		3 21 0.062807135247238632 24 0.29356874124009563 25 0.64362412351266574
		3 21 0.24107423863207428 24 0.21132564135315576 25 0.5476001200147701
		3 24 0.33816569649343042 25 0.50266971654741921 28 0.15916458695915039
		3 24 0.40498528535142925 25 0.51796572467530455 28 0.077048989973266063
		3 20 0.1337354753987807 24 0.37185584041366804 25 0.49440868418755118
		3 24 0.37981480799277378 25 0.36140069824812154 28 0.25878449375910467
		3 24 0.46535965064738483 25 0.32495305303515609 28 0.20968729631745903
		3 20 0.2021087827893352 24 0.43108879342597739 25 0.36680242378468747
		3 20 0.41100463419701072 24 0.38729523602182325 25 0.20170012978116583
		3 20 0.29307652170176862 24 0.3787753873497382 25 0.32814809094849318
		3 21 0.76716796877933191 22 0.20008648898540882 23 0.032745542235259252
		3 21 0.85239715794266879 22 0.065784053416030053 25 0.081818788641301141
		3 20 0.066329018186925923 21 0.83879549930870256 22 0.0948754825043715
		3 21 0.75959105319053211 22 0.20777192737768357 23 0.032637019431784445
		3 21 0.83239553199329896 22 0.14521215768176302 23 0.022392310324938058
		3 20 0.043824333283078984 21 0.89188786801514852 22 0.064287798701772522
		3 20 0.076157872944933411 21 0.76926069449510293 25 0.15458143255996365
		3 20 0.12940626978938596 21 0.81457934659379372 25 0.056014383616820214
		3 20 0.1790647197349822 21 0.78370090336765785 22 0.037234376897360082
		3 20 0.19927881085083254 21 0.61645774009435683 25 0.18426344905481057
		3 20 0.31868996688404466 21 0.62422755864055501 24 0.057082474475400262
		3 20 0.33072452989154627 21 0.65154520750747003 22 0.017730262600983752
		3 20 0.36737775461168121 21 0.41606380200480103 24 0.21655844338351776
		3 20 0.50150029050470846 21 0.37673166894106092 24 0.12176804055423072
		3 16 0.032359897608921814 20 0.46986104385652905 21 0.49777905853454901
		3 28 0.095334903452894276 29 0.73406412881935357 30 0.17060096772775221
		3 28 0.20514924805555468 29 0.68735836241027704 33 0.1074923895341683
		3 25 0.28377409992563535 28 0.13769799210250794 29 0.57852790797185683
		3 25 0.15129201779303059 29 0.5525280631085312 30 0.29617991909843816
		3 28 0.075353422350106475 29 0.66890499228788447 30 0.25574158536200908
		3 28 0.19961149150842902 29 0.69992238379182536 30 0.10046612469974567
		3 28 0.33602118078218718 29 0.44206511637866436 33 0.22191370283914857
		3 28 0.38629306296715171 29 0.54179550222641237 33 0.071911434806435914
		3 25 0.19194375347729103 28 0.31474595115048948 29 0.49331029537221954
		3 28 0.41071250123348335 29 0.25606743522526554 33 0.33322006354125117
		3 28 0.54582560699611993 29 0.30170333884269157 33 0.1524710541611885
		3 24 0.16047112661108612 28 0.50992538627236439 29 0.32960348711654963
		3 28 0.429715491671817 32 0.23197162256340353 33 0.33831288576477953
		3 28 0.60277285914475476 32 0.1983602632165116 33 0.19886687763873365
		3 24 0.18293174539288579 28 0.61958199280751813 29 0.197486261799596
		3 24 0.32159886321742853 25 0.17370651095403353 28 0.50469462582853808
		3 24 0.29225664034440219 25 0.22776224272463055 28 0.47998111693096729
		3 32 0.018401366039361225 33 0.62076055593727586 34 0.36083807802336287
		3 32 0.051447843225202426 33 0.77404329920506598 34 0.17450885756973158
		3 29 0.1574177708695782 33 0.67438080080191576 34 0.16820142832850607
		3 29 0.058859938916204009 33 0.60067191082759686 34 0.34046815025619903
		3 29 0.025662991663782046 33 0.6017174542896454 34 0.3726195540465726
		3 32 0.051260258468393695 33 0.75326437817462577 34 0.1954753633569806
		3 32 0.12247943221854359 33 0.80502028425166072 34 0.072500283529795637
		3 32 0.13538247268792661 33 0.78223169621213073 34 0.082385831099942644
		3 28 0.11070564972439319 32 0.13519841901424112 33 0.75409593126136565
		3 32 0.21193638159168202 33 0.75658819524914678 34 0.031475423159171123
		3 28 0.048940239277178173 32 0.27493521775230512 33 0.67612454297051661
		3 28 0.1128031159382782 32 0.2471814625613937 33 0.64001542150032809
		3 16 0.045596274264020839 32 0.3410981123526885 33 0.6133056133832907
		3 16 0.085900042287774911 32 0.43216818065492751 33 0.48193177705729751
		3 28 0.11673745005366766 32 0.35586115391274653 33 0.52740139603358593
		3 28 0.269156254658726 32 0.38182278055199115 33 0.34902096478928274
		3 28 0.22121872822006738 32 0.30578514567082038 33 0.47299612610911207;
	setAttr ".wl[2000:2166].w"
		3 25 0.12878434975465131 29 0.60989207065792506 30 0.26132357958742375
		3 25 0.21853148155878491 28 0.087080592815404284 29 0.69438792562581098
		3 28 0.083735238375973201 29 0.818395932519839 33 0.097868829104187871
		3 28 0.044439208075183388 29 0.78771623020368053 30 0.1678445617211361
		3 25 0.046402729738502804 29 0.75161079305681555 30 0.20198647720468166
		3 28 0.086451963831048362 29 0.85423004546405545 30 0.059317990704896253
		3 25 0.12606209353457984 28 0.17452059815063714 29 0.69941730831478288
		3 28 0.15913642854669308 29 0.78905544281384143 33 0.051808128639465677
		3 28 0.12704471722261138 29 0.65443996331188015 33 0.21851531946550851
		3 25 0.09463792119107628 28 0.26608792773337708 29 0.63927415107554653
		3 28 0.24760567605140937 29 0.62147142131479105 33 0.13092290263379974
		3 28 0.17204284208855972 29 0.48136345785810714 33 0.34659370005333323
		3 24 0.1074929245949158 28 0.34538022249418054 29 0.54712685291090379
		3 28 0.35610935774552077 29 0.46014308228593698 33 0.18374755996854228
		3 28 0.23083491592290184 29 0.39080097793413154 33 0.37836410614296651
		3 32 0.026596624462217219 33 0.84249384302722297 34 0.13090953251055978
		3 32 0.011208445163970777 33 0.69978877938004735 34 0.28900277545598174
		3 29 0.061456834140281601 33 0.6638572563957591 34 0.27468590946395938
		3 29 0.17932976402139689 33 0.72272065032574884 34 0.097949585652854401
		3 29 0.036302585097059879 33 0.84886255250860221 34 0.11483486239433795
		3 29 0.028000760824623622 33 0.70474083483190819 34 0.26725840434346826
		3 28 0.042610905035069126 29 0.11926748363987139 33 0.83812161132505947
		3 32 0.040316760916058562 33 0.91510237702798869 34 0.044580862055952644
		3 32 0.062780231201544134 33 0.8840504728789419 34 0.053169295919514054
		3 29 0.080951836462277937 32 0.066956156700710021 33 0.85209200683701225
		3 29 0.025257920931724787 32 0.1224267623639803 33 0.85231531670429495
		3 32 0.13667147310562625 33 0.83991403518186913 34 0.023414491712504482
		3 29 0.08231783099017638 32 0.14393779795900574 33 0.77374437105081795
		3 16 0.079751005154104146 32 0.27930087729133324 33 0.64094811755456271
		3 16 0.038003993715345505 32 0.25837307893450318 33 0.70362292735015119
		3 28 0.14507473265381415 29 0.18764553107150367 33 0.66727973627468218
		3 28 0.25167467969853652 29 0.23012272707785691 33 0.51820259322360651
		3 24 0.133851580788243 25 0.77531868390658698 29 0.090829735305170051
		3 24 0.045765087932396156 25 0.68653157604371295 26 0.2677033360238909
		3 21 0.13580665894854563 25 0.625374720038674 26 0.2388186210127802
		3 21 0.24411947021030789 25 0.67251458877702874 26 0.083365941012663411
		3 24 0.11244348463732332 25 0.79308465860494981 26 0.094471856757726985
		3 21 0.066575072371802255 25 0.71735385124089823 26 0.2160710763872995
		3 21 0.23979310752403785 24 0.1651301213462219 25 0.59507677112974033
		3 21 0.07263325077695304 24 0.24509868154703152 25 0.68226806767601533
		3 24 0.2045188231408894 25 0.59612494619665335 29 0.19935623066245714
		3 21 0.21423479844924698 24 0.29595657228351896 25 0.48980862926723395
		3 24 0.39137742107947932 25 0.49878130250406721 29 0.10984127641645333
		3 24 0.28919474223302977 25 0.48178135291045843 29 0.22902390485651175
		3 20 0.24688658477438388 24 0.40156153273546236 25 0.35155188249015379
		3 24 0.46054051959830827 25 0.32588219156514975 28 0.21357728883654215
		3 24 0.35790224249467678 25 0.36060029351605388 29 0.28149746398926939
		3 24 0.21164747882706555 28 0.32633998764200495 29 0.46201253353092953
		3 24 0.25998204055589352 28 0.38715433645405362 29 0.35286362299005292
		3 21 0.7492307798202591 22 0.16168960917618722 25 0.089079611003553702
		3 21 0.61322406829191201 22 0.35115631107858702 23 0.035619620629500963
		3 20 0.038467385870389427 21 0.61717285157323065 22 0.3443597625563799
		3 20 0.12221648091961058 21 0.73724454906125847 22 0.14053897001913093
		3 20 0.1034510700143265 21 0.75948630240851556 22 0.13706262757715798
		3 20 0.039542662747443814 21 0.63298372910926404 22 0.32747360814329202
		3 20 0.29058972790853821 21 0.66882933306328629 22 0.040580939028175403
		3 20 0.2247853705113857 21 0.71713880682393183 25 0.058075822664682468
		3 20 0.16942208693711522 21 0.6616412780051778 25 0.16893663505770704
		3 20 0.41479780440445574 21 0.55821387250773158 24 0.026988323087812731
		3 20 0.39228852006605675 21 0.54231075644818905 24 0.065400723485754181
		3 20 0.31320351188829293 21 0.54744287991360729 24 0.13935360819809969
		3 16 0.043240723528461859 20 0.49597666664798673 21 0.46078260982355129
		3 16 0.13312600330395549 20 0.51982845302825409 21 0.34704554366779039
		3 20 0.41225251425769355 21 0.41502662198352541 24 0.17272086375878115
		3 20 0.34862436148022435 21 0.36899367544781297 24 0.28238196307196267
		3 20 0.40377176232008721 21 0.24958827947431769 24 0.34663995820559518
		3 21 0.67528148959190049 22 0.29076355390346842 23 0.033954956504631005
		3 20 0.092871171543591577 21 0.77297887003845178 22 0.13414995841795677
		3 20 0.22689372446403969 21 0.72247170361686897 22 0.050634571919091383
		3 20 0.40851960478808291 21 0.57421515888969943 24 0.017265236322217718
		3 16 0.036967159361310065 20 0.51504600786353238 21 0.44798683277515772
		3 32 0.022335002210525284 33 0.71227657983337134 34 0.26538841795610341
		3 32 0.051884474462522423 33 0.83082341657025227 34 0.11729210896722528
		3 32 0.1135620088676328 33 0.83904086096027863 34 0.047397130172088575
		3 16 0.022305673003915994 32 0.2271396891428136 33 0.75055463785327048
		3 16 0.04809870384053775 32 0.33789913651929415 33 0.61400215964016802
		3 16 0.13012131174363881 32 0.42444558546088657 33 0.44543310279547449
		3 16 0.11351726220877643 20 0.55392170363870197 21 0.33256103415252158
		3 28 0.12186290723900844 29 0.24851137670966705 33 0.62962571605132434
		3 25 0.27303626733650843 28 0.24572449348709707 29 0.48123923917639444
		3 21 0.44086991036935375 24 0.26191529156390558 25 0.2972147980667405
		3 21 0.33386586937824919 24 0.27746762523559909 25 0.38866650538615177
		3 24 0.2949224857767403 25 0.34752279549578785 28 0.35755471872747169
		3 28 0.25807283700494849 32 0.20832693826351428 33 0.53360022473153712
		3 29 0.046783584287141002 33 0.58592342239048623 34 0.36729299332237275
		3 29 0.25903663257124449 33 0.59478822825478272 34 0.14617513917397271
		3 28 0.098267124874598169 29 0.77209197389230444 33 0.12964090123309735
		3 28 0.053186079477323664 29 0.73421517584365625 30 0.21259874467902001
		3 25 0.37616621891613683 29 0.50543069332623825 30 0.11840308775762479
		3 25 0.13774614929062101 29 0.475087213503539 30 0.38716663720584016
		3 28 0.22791992043651035 29 0.26430239138986217 33 0.50777768817362756
		3 28 0.15399766709552989 29 0.48726999763626372 33 0.3587323352682063
		3 28 0.093411850167040136 29 0.57538027310194428 33 0.33120787673101548
		3 28 0.072942195875447827 29 0.55609186445676695 33 0.37096593966778529
		3 28 0.086731902832733201 29 0.36925045711536092 33 0.54401764005190578
		3 16 0.30945189857674937 20 0.52429969556166445 21 0.16624840586158635
		3 16 0.35313242872801276 20 0.48034675714830916 24 0.1665208141236782
		3 16 0.31165411157973377 20 0.5236460424263103 21 0.16469984599395601
		3 16 0.19562037304993909 24 0.42163767915494216 28 0.38274194779511866
		3 16 0.34748745654128249 20 0.33905148185857309 24 0.31346106160014436
		3 16 0.25441946471118221 24 0.39666790233439542 28 0.34891263295442232
		3 16 0.40865035611312567 20 0.31829766431270751 24 0.27305197957416688
		3 16 0.20347946706098827 28 0.52121094094419063 32 0.27530959199482119
		3 16 0.20314373889131015 24 0.29418235640353002 28 0.50267390470515994
		3 16 0.31986242005078941 28 0.27116089369432744 32 0.40897668625488315
		3 16 0.28578421244807323 32 0.46893735958638805 33 0.24527842796553881
		3 16 0.3747031979179512 32 0.4560253908376517 33 0.16927141124439715
		3 16 0.30279527385113786 32 0.3965320914047229 33 0.3006726347441393
		3 24 0.28103926262645407 28 0.4750044576693897 29 0.24395627970415618
		3 28 0.47704812205505981 29 0.31167588089094406 33 0.21127599705399608
		3 16 0.40664226696466538 28 0.30845846047685638 32 0.28489927255847836
		3 24 0.022349137111967843 25 0.60518366611912333 26 0.37246719676890877
		3 25 0.79444545050440507 26 0.10837960392889999 29 0.097174945566694995
		3 24 0.16993280390364349 25 0.37148289817437247 29 0.45858429792198391
		3 24 0.11941796459398686 25 0.56908287027389348 29 0.31149916513211962
		3 24 0.10401667319402777 25 0.64475849538396757 29 0.25122483142200475
		3 24 0.12847066852843358 25 0.614163528908097 29 0.25736580256346941
		3 24 0.21107722925470915 25 0.45694221614599606 29 0.33198055459929465
		3 21 0.38091192602987844 25 0.54759538395853913 26 0.071492690011582524
		3 21 0.14328631156203217 25 0.62429218142799359 26 0.23242150700997416
		3 21 0.77502333892151454 22 0.11907172652731499 25 0.10590493455117052
		3 21 0.6763890580978752 22 0.2854178358343033 23 0.03819310606782151
		3 21 0.5033649219368973 24 0.15398980405483809 25 0.34264527400826472
		3 21 0.60445792954310229 24 0.074606669257387945 25 0.3209354011995097
		3 21 0.67624722374229329 24 0.044762134188537493 25 0.27899064206916907
		3 21 0.58021042258095934 24 0.07653196750821567 25 0.3432576099108251
		3 21 0.43539987133992053 24 0.18078087742360255 25 0.38381925123647698
		3 16 0.41031789158417448 24 0.22329703926054181 28 0.36638506915528374
		3 16 0.43063486157087943 24 0.21436222351204781 28 0.35500291491707275
		3 25 0.32383101738892062 26 0.53031169973391468 27 0.14585728287716476
		3 25 0.28364455544895639 26 0.55000815928414659 27 0.16634728526689702
		3 25 0.1841642144885231 26 0.62259560710962714 27 0.19324017840184976
		3 25 0.1141961895157424 26 0.7607521057158706 27 0.12505170476838698
		3 25 0.21426734442445988 26 0.70396113086346834 27 0.081771524712071636
		3 25 0.29158442626536046 26 0.62466399276300155 27 0.083751580971637915
		3 25 0.07888038984982268 26 0.70499261458459161 27 0.21612699556558568
		3 25 0.31218481028666356 26 0.56257121365840812 27 0.12524397605492818
		3 25 0.43844693981325411 26 0.48446646529784987 27 0.077086594888895993
		3 25 0.26411278951557843 26 0.64874859600655532 27 0.087138614477866125
		3 25 0.35359883593478919 26 0.61264071194513803 27 0.033760452120072802
		3 21 0.023070509532344144 25 0.49211331870923347 26 0.4848161717584224
		3 21 0.037402583610660796 25 0.46373799119060022 26 0.49885942519873894
		3 25 0.52563118369096185 26 0.43284038753845966 27 0.041528428770578572
		3 25 0.54722961114998847 26 0.39761719197818274 27 0.055153196871828611
		3 25 0.52770286407835165 26 0.40818732581661582 27 0.0641098101050325
		3 25 0.16686450227510541 26 0.57279067959047125 27 0.26034481813442339
		3 25 0.11607718285089863 26 0.58056643703416 27 0.30335638011494148
		3 25 0.059587771136130306 26 0.60634966461656459 27 0.33406256424730513
		3 25 0.022677467519672034 26 0.67739441519300225 27 0.29992811728732566
		3 25 0.050591457748761282 26 0.71922403894924603 27 0.23018450330199253
		3 25 0.11859990262740291 26 0.66433773512715366 27 0.21706236224544334
		3 25 0.023149963177228831 26 0.62516982560210244 27 0.35168021122066873
		3 25 0.14871011759524333 26 0.59077038936986481 27 0.26051949303489186
		3 25 0.028140331838312639 26 0.48929542264218256 27 0.48256424551950472
		3 25 0.029743857357560882 26 0.48897025893181023 27 0.4812858837106288
		3 25 0.024390676883669072 26 0.49038407855525873 27 0.4852252445610723
		3 25 0.021572371632309854 26 0.49031761338307539 27 0.48811001498461459
		3 25 0.022534446580973155 26 0.49037730334374974 27 0.48708825007527723
		3 25 0.021522363538450981 26 0.49335937758326226 27 0.4851182588782868
		3 25 0.020537862060164502 26 0.49121399715083403 27 0.48824814078900158
		3 25 0.024042771110612579 26 0.49264132856635012 27 0.48331590032303728
		3 25 0.031693225142798466 26 0.48415338742860081 27 0.48415338742860081
		3 25 0.034200186683899646 26 0.48289990665805016 27 0.48289990665805016
		3 25 0.031866708479903673 26 0.4840666457600481 27 0.4840666457600481
		3 25 0.035040367842077119 26 0.48247981607896145 27 0.48247981607896145
		3 25 0.038391067595063104 26 0.48080446620246842 27 0.48080446620246842
		2 25 0.036957352309024201 26 0.48152132384548785;
	setAttr ".wl[2166:2333].w"
		1 27 0.48152132384548785
		3 25 0.027733274435109027 26 0.48613336278244546 27 0.48613336278244546
		3 25 0.029684874318602554 26 0.48515756284069872 27 0.48515756284069872
		3 25 0.029989136334233901 26 0.48500543183288308 27 0.48500543183288308
		3 25 0.023762002895257969 26 0.5448140612537139 27 0.43142393585102817
		3 25 0.012241856941431206 26 0.56217991059581529 27 0.4255782324627535
		3 25 0.011317581574289465 26 0.55813792171629595 27 0.43054449670941447
		3 25 0.014180576144429529 26 0.60443932514397314 27 0.38138009871159739
		3 25 0.028795768116120529 26 0.60530729196016386 27 0.36589693992371558
		3 25 0.05095756046504709 26 0.57260740268560539 27 0.37643503684934759
		3 25 0.073736107991475078 26 0.55816667082600424 27 0.36809722118252075
		3 25 0.045435015094680807 26 0.5430934733367756 27 0.4114715115685435
		3 25 0.017491136942366824 26 0.50486357904464385 27 0.47764528401298922
		3 25 0.014859295654169286 26 0.50668733814923661 27 0.47845336619659418
		3 25 0.016840025417247415 26 0.50148021832759293 27 0.48167975625515957
		3 25 0.015639673914393318 26 0.51437120801929415 27 0.46998911806631238
		3 25 0.015882045326413408 26 0.52648029077493574 27 0.45763766389865085
		3 25 0.021707033524072397 26 0.51709090345605691 27 0.4612020630198706
		3 25 0.030347803763979556 26 0.51096404013979191 27 0.45868815609622871
		3 25 0.0254937017571004 26 0.50413268428556623 27 0.4703736139573334
		3 25 0.036618350152734978 26 0.48191822182255739 27 0.48146342802470771
		3 25 0.032078543264007546 26 0.48429660752352571 27 0.48362484921246685
		3 25 0.026489505840128311 26 0.48687379772528272 27 0.48663669643458884
		3 25 0.02467965552825184 26 0.48766017223587405 27 0.48766017223587405
		3 25 0.026503759456678884 26 0.48674812027166053 27 0.48674812027166053
		3 25 0.027080686781895656 26 0.48645965660905216 27 0.48645965660905216
		3 25 0.028703566431107976 26 0.48584122053977907 27 0.48545521302911293
		3 25 0.032792443118400433 26 0.48401686746692113 27 0.48319068941467846
		3 21 0.051040190423836916 22 0.47447990478808155 23 0.47447990478808155
		3 21 0.056728187772643698 22 0.47163590611367817 23 0.47163590611367817
		3 21 0.052048375060807832 22 0.47427496974271061 23 0.47367665519648183
		3 21 0.04375101899858086 22 0.48079313858649397 23 0.47545584241492522
		3 21 0.042568110086456931 22 0.48095954748493708 23 0.47647234242860614
		3 21 0.040317298505445756 22 0.4806613445958236 23 0.47902135689873065
		3 21 0.044810802644984653 22 0.47759459867750764 23 0.47759459867750764
		3 21 0.048137702419727493 22 0.47714446045903142 23 0.4747178371212411
		3 21 0.055390470596094282 22 0.47230476470195287 23 0.47230476470195287
		3 21 0.058347678066499806 22 0.47082616096675001 23 0.47082616096675001
		3 21 0.05527515604870703 22 0.47236242197564648 23 0.47236242197564648
		3 21 0.059026505738399827 22 0.47048674713080008 23 0.47048674713080008
		3 21 0.060341975745076402 22 0.46982901212746186 23 0.46982901212746186
		3 21 0.058393620024575099 22 0.47080318998771248 23 0.47080318998771248
		3 21 0.05013326444606335 22 0.47493336777696832 23 0.47493336777696832
		3 21 0.051621335939180578 22 0.47418933203040969 23 0.47418933203040969
		3 21 0.051272711884215443 22 0.47436364405789233 23 0.47436364405789233
		3 21 0.48786607127789339 22 0.42694440968338865 23 0.085189519038717923
		3 21 0.58613336336923871 22 0.34259721161321699 23 0.071269425017544338
		3 21 0.4503955174387374 22 0.45523034646618943 23 0.094374136095073058
		3 21 0.35649251937683951 22 0.54393162894552083 23 0.099575851677639771
		3 21 0.3321495388427072 22 0.5633819416084842 23 0.10446851954880852
		3 21 0.35286641537485847 22 0.54772303385047216 23 0.099410550774669315
		3 21 0.30738702327005635 22 0.59611241916310442 23 0.096500557566839368
		3 21 0.41699935236921815 22 0.5052176995030766 23 0.077782948127705198
		3 21 0.26579504718545571 22 0.60655512219692964 23 0.12764983061761473
		3 21 0.28864500659562109 22 0.56185920937357459 23 0.14949578403080435
		3 21 0.20075470827887745 22 0.60660230718240782 23 0.19264298453871476
		3 21 0.14329096508945111 22 0.63575449801739747 23 0.22095453689315148
		3 21 0.14892330846141452 22 0.62585638072508387 23 0.22522031081350158
		3 21 0.16102033001439131 22 0.64832388753336379 23 0.19065578245224477
		3 21 0.12179062658876981 22 0.71133293608226233 23 0.1668764373289679
		3 21 0.19162244479518109 22 0.6792918771110783 23 0.12908567809374064
		3 21 0.12858530372806454 22 0.68225874507693762 23 0.18915595119499803
		3 21 0.11329862319391461 22 0.62505369981231862 23 0.26164767699376668
		3 21 0.073264320026389454 22 0.59610366341288745 23 0.33063201656072322
		3 21 0.049933511706577241 22 0.58584140487138459 23 0.36422508342203819
		3 21 0.057430307662921599 22 0.602770850257206 23 0.33979884207987254
		3 21 0.056733783294033856 22 0.66314153065104797 23 0.28012468605491808
		3 21 0.041997780064161695 22 0.71153824825490153 23 0.24646397168093676
		3 21 0.070926764329009906 22 0.73165529779873939 23 0.19741793787225081
		3 21 0.055176598420115831 22 0.64896318014412135 23 0.29586022143576279
		3 21 0.049947528805170872 22 0.56745989837095723 23 0.38259257282387182
		3 21 0.030350922978871427 22 0.52983874813087528 23 0.4398103288902534
		3 21 0.02300671444934357 22 0.52991076632972578 23 0.44708251922093062
		3 21 0.025020508419126508 22 0.56560573585110596 23 0.40937375572976753
		3 21 0.025477818304231722 22 0.61856922547942084 23 0.35595295621634726
		3 21 0.026114040009519654 22 0.64811449383297792 23 0.32577146615750247
		3 21 0.034120709949330731 22 0.67878992131579996 23 0.28708936873486923
		3 21 0.037249878076617331 22 0.53601646112730339 23 0.42673366079607944
		3 21 0.032286645869528501 22 0.50295680132535647 23 0.46475655280511508
		3 21 0.026078636960958093 22 0.49223626112092256 23 0.48168510191811942
		3 21 0.022142863147621469 22 0.50109879688852232 23 0.47675833996385625
		3 21 0.023047950297405185 22 0.52248584267560383 23 0.45446620702699103
		3 21 0.024564281865094982 22 0.55781417534576416 23 0.41762154278914093
		3 21 0.028456026766163423 22 0.57103952897322197 23 0.40050444426061443
		3 21 0.034122030897186482 22 0.56883220988524752 23 0.39704575921756613
		3 21 0.040067656223525337 22 0.48802114228967092 23 0.4719112014868036
		3 21 0.040844490315444341 22 0.48077419674688632 23 0.47838131293766933
		3 21 0.03704590663038719 22 0.48147706171008858 23 0.48147703165952438
		3 21 0.031274743980653739 22 0.48482041832112899 23 0.48390483769821729
		3 21 0.028541773403350901 22 0.49000450334124396 23 0.4814537232554052
		3 21 0.03092793754307362 22 0.50320724778938275 23 0.46586481466754359
		3 21 0.035190663908240015 22 0.50615071885570773 23 0.45865861723605239
		3 21 0.038547461475479501 22 0.49948940772650774 23 0.46196313079801266
		3 29 0.032776708064221186 30 0.48594763555603138 31 0.4812756563797474
		3 29 0.030740981463506394 30 0.48781978353685612 31 0.48143923499963742
		3 29 0.030049647492957916 30 0.48777910063857971 31 0.48217125186846227
		3 29 0.029945796380624716 30 0.4892199202885853 31 0.48083428333079004
		3 29 0.033320645221263434 30 0.48567501727093032 31 0.48100433750780636
		3 29 0.033228152196435295 30 0.48563154648977086 31 0.48114030131379376
		3 29 0.030796966306783739 30 0.48652110430009354 31 0.48268192939312271
		3 29 0.034213841036894732 30 0.48364559102123456 31 0.48214056794187077
		3 29 0.03379138139267298 30 0.48310430930366349 31 0.48310430930366349
		3 29 0.03354385582145096 30 0.4832280720892746 31 0.4832280720892746
		3 29 0.034264078382901353 30 0.48286796080854938 31 0.48286796080854938
		3 29 0.032163897404623103 30 0.48391805129768845 31 0.48391805129768845
		3 29 0.032712859693035522 30 0.48364357015348225 31 0.48364357015348225
		3 29 0.033898337047660876 30 0.48305083147616956 31 0.48305083147616956
		3 29 0.035070455878105575 30 0.48246477206094729 31 0.48246477206094729
		3 29 0.035177018973457048 30 0.48241149051327153 31 0.48241149051327153
		3 29 0.034601452093556903 30 0.48269927395322154 31 0.48269927395322154
		3 28 0.029677999838196096 29 0.58240145869346516 30 0.3879205414683386
		3 29 0.48908651928909286 30 0.47814081828996474 31 0.032772662420942525
		3 25 0.050861229026478626 29 0.38437011161239887 30 0.5647686593611223
		3 25 0.036999929742031791 29 0.27125647178397744 30 0.69174359847399081
		3 25 0.045627569384639313 29 0.37490737185355416 30 0.57946505876180643
		3 25 0.023801597750706536 29 0.5072083139643081 30 0.46899008828498528
		3 29 0.58237977117710549 30 0.3928711881518786 31 0.024749040671015861
		3 28 0.021412536705973133 29 0.62030218280610094 30 0.35828528048792585
		3 29 0.3876610751104006 30 0.54530408084111914 31 0.067034844048480244
		3 29 0.29436091015512506 30 0.6238732964170578 31 0.081765793427817118
		3 29 0.20618818775629003 30 0.72680295828024999 31 0.067008853963459944
		3 29 0.13270032588568453 30 0.81910244536273802 31 0.04819722875157726
		3 29 0.15222326229134889 30 0.80521291690368735 31 0.042563820804963667
		3 29 0.24805055759479178 30 0.69847708809162545 31 0.05347235431358268
		3 29 0.3351017642636151 30 0.58501710085937819 31 0.079881134877006876
		3 29 0.40595347594643932 30 0.51870426638672762 31 0.075342257666833001
		3 29 0.22506997786996688 30 0.61689687177745456 31 0.15803315035257856
		3 29 0.13980753166825155 30 0.69074007419598804 31 0.16945239413576041
		3 29 0.09204772757129763 30 0.77834793541880654 31 0.12960433700989579
		3 29 0.067098571037903454 30 0.82737678266327153 31 0.10552464629882496
		3 29 0.055586943283086672 30 0.81692181718910084 31 0.12749123952781255
		3 29 0.097275465359124236 30 0.8075233280412828 31 0.0952012065995929
		3 29 0.12288899937372817 30 0.70416534217102822 31 0.17294565845524365
		3 29 0.18482404180303069 30 0.62024428581255253 31 0.19493167238441694
		3 29 0.076757109611295504 30 0.62053659825332508 31 0.30270629213537942
		3 29 0.05013433317401763 30 0.6740069215486989 31 0.27585874527728343
		3 29 0.039402636352487821 30 0.7240097236264551 31 0.23658764002105689
		3 29 0.033551547460907001 30 0.73169452630600595 31 0.23475392623308697
		3 29 0.028314542250305722 30 0.69590341224842922 31 0.27578204550126506
		3 29 0.044334614086265003 30 0.74625342349044843 31 0.20941196242328652
		3 29 0.034290534304637826 30 0.64776879516878982 31 0.31794067052657227
		3 29 0.063915431803453007 30 0.62771939108675179 31 0.30836517710979533
		3 29 0.02375668933767985 30 0.56970927573318231 31 0.40653403492913803
		3 29 0.022912339085164699 30 0.59781786760552313 31 0.3792697933093121
		3 29 0.024213343448624663 30 0.6092910178131612 31 0.36649563873821417
		3 29 0.024904628217173659 30 0.58655586495367795 31 0.3885395068291484
		3 29 0.022258480549035377 30 0.57775722616568137 31 0.39998429328528329
		3 29 0.021504098592257472 30 0.61315116523027036 31 0.36534473617747204
		3 29 0.016777734540513022 30 0.57940467420524544 31 0.4038175912542416
		3 29 0.02325396393476405 30 0.56732450801065115 31 0.40942152805458476
		3 29 0.023409284941673929 30 0.51074846954639486 31 0.46584224551193126
		3 29 0.02506537791283615 30 0.51598085731455812 31 0.45895376477260597
		3 29 0.027681507697576789 30 0.51335682600508725 31 0.45896166629733598
		3 29 0.030535271699819354 30 0.49886477723365558 31 0.47059995106652502
		3 29 0.028064232243872531 30 0.50830738311022006 31 0.4636283846459075
		3 29 0.025562046589358307 30 0.5144858706248665 31 0.45995208278577526
		3 29 0.020667931464702746 30 0.52359138133039285 31 0.4557406872049044
		3 29 0.022532801391088993 30 0.50671857030539502 31 0.4707486283035161
		3 33 0.003075740004913488 34 0.49846212999754319 35 0.49846212999754319
		3 33 0.002805597914029 34 0.49859720104298549 35 0.49859720104298549
		3 33 0.0023051571804059584 34 0.49884742140979699 35 0.49884742140979699
		3 33 0.00170784336361832 34 0.49914607831819086 35 0.49914607831819086
		3 33 0.0019226627470415698 34 0.49903866862647922 35 0.49903866862647922
		3 33 0.002235658620468321 34 0.49888217068976581 35 0.49888217068976581
		3 33 0.0020346747625390633 34 0.49898266261873042 35 0.49898266261873042
		3 33 0.0027518376471459484 34 0.49862408117642709 35 0.49862408117642709
		3 33 0.0029413087652262562 34 0.49852934561738688 35 0.49852934561738688
		1 33 0.0032912790537346021;
	setAttr ".wl[2333:2499].w"
		2 34 0.49835436047313264 35 0.49835436047313264
		3 33 0.0032550032395606389 34 0.49837249838021963 35 0.49837249838021963
		3 33 0.0030343872327933037 34 0.49848280638360343 35 0.49848280638360343
		3 33 0.0033476111667933195 34 0.49832619441660336 35 0.49832619441660336
		3 33 0.003330160190260193 34 0.49833491990486989 35 0.49833491990486989
		3 33 0.0024182522360232596 34 0.49879087388198839 35 0.49879087388198839
		3 33 0.0027680164466704349 34 0.49861599177666477 35 0.49861599177666477
		3 33 0.0029826688269810886 34 0.49850866558650941 35 0.49850866558650941
		3 33 0.38156038404035902 34 0.59765877437929549 35 0.020780841580345467
		3 33 0.39540366056660076 34 0.57923708205812507 35 0.025359257375274051
		3 33 0.41781334869176545 34 0.55993234668599701 35 0.022254304622237531
		3 33 0.35835578462337547 34 0.61936742537916589 35 0.022276789997458728
		3 33 0.44403214059371027 34 0.54649681999881927 35 0.0094710394074705717
		3 33 0.47185110481820602 34 0.52172151255741139 35 0.006427382624382685
		3 33 0.45821504330696894 34 0.53411610765208373 35 0.0076688490409473524
		3 33 0.47785303547225094 34 0.51237812907745717 35 0.0097688354502918247
		3 33 0.20273944054601034 34 0.72360328079685643 35 0.073657278657133271
		3 33 0.22755344609738537 34 0.69116013005774313 35 0.081286423844871489
		3 33 0.22200471995122634 34 0.69860316550902013 35 0.079392114539753394
		3 33 0.15526098551698977 34 0.74626169038465651 35 0.098477324098353691
		3 33 0.21185935416494206 34 0.72922248869489137 35 0.058918157140166585
		3 33 0.24102729155662797 34 0.71533272491449162 35 0.043639983528880488
		3 33 0.26751794974409282 34 0.70467625950084523 35 0.02780579075506211
		3 33 0.23604005318754301 34 0.71784258170662651 35 0.046117365105830616
		3 33 0.09056040675189074 34 0.70848524086743336 35 0.20095435238067599
		3 33 0.098671755165018263 34 0.69427367775515725 35 0.20705456707982456
		3 33 0.079746875321313443 34 0.70952318925992874 35 0.21072993541875781
		3 33 0.042625687492192636 34 0.70293777851077832 35 0.2544365339970292
		3 33 0.06628746154655081 34 0.7430696640507426 35 0.19064287440270664
		3 33 0.082119722736440762 34 0.75853172440153072 35 0.1593485528620284
		3 33 0.11256990847502737 34 0.77586268094458011 35 0.11156741058039252
		3 33 0.082844108835723046 34 0.74614039988959002 35 0.17101549127468674
		3 33 0.030240116517396845 34 0.61346651572315714 35 0.35629336775944614
		3 33 0.028305897883748651 34 0.61403949852671791 35 0.35765460358953338
		3 33 0.018040066464405501 34 0.61457200495027653 35 0.36738792858531799
		3 33 0.0074369110998444886 34 0.58434951491879639 35 0.40821357398135916
		3 33 0.013288966542549222 34 0.62987835557765626 35 0.3568326778797945
		3 33 0.017871633891958848 34 0.65566124306494866 35 0.32646712304309256
		3 33 0.02977883645086209 34 0.69617197395741348 35 0.27404918959172447
		3 33 0.025048082024629253 34 0.6373373596658265 35 0.33761455830954423
		3 33 0.0056085512225502229 34 0.52976448666294096 35 0.46462696211450882
		3 33 0.004455525061086256 34 0.53006616269574669 35 0.46547831224316705
		3 33 0.0024946111030026085 34 0.52214920940966691 35 0.47535617948733044
		3 33 0.001316725495396974 34 0.51362160087502651 35 0.48506167362957658
		3 33 0.0017710292435099727 34 0.52775190728336974 35 0.47047706347312024
		3 33 0.002261918189663713 34 0.53905170136933833 35 0.45868638044099791
		3 33 0.0047215938531116591 34 0.56310898946035015 35 0.43216941668653802
		3 33 0.0049066592748265069 34 0.53433110773618686 35 0.46076223298898666
		3 33 0.0016455384016103129 34 0.50281724938731476 35 0.495537212211075
		3 33 0.0018609147844055388 34 0.50238438978844369 35 0.49575469542715084
		3 33 0.0021882994914700976 34 0.50033549188701809 35 0.49747620862151182
		3 33 0.0016573229113114867 34 0.50110076326112607 35 0.4972419138275625
		3 33 0.0012987148482757414 34 0.50158444580478323 35 0.49711683934694101
		3 33 0.0011368927832051757 34 0.50321219825153263 35 0.49565090896526226
		3 33 0.0011903623180655445 34 0.50624925012812672 35 0.49256038755380788
		3 33 0.0013712069253797488 34 0.5035686043149542 35 0.49506018875966606
		3 15 0.33791773641449313 16 0.65491176344714053 17 0.0071705001383663911
		3 15 0.43043024882533593 16 0.56577107698325102 17 0.003798674191413067
		3 15 0.30595667295336948 16 0.68583654567894803 17 0.0082067813676824659
		3 15 0.26833084542410163 16 0.71470788195607715 17 0.01696127261982127
		3 15 0.36483136758131068 16 0.62844690750439225 17 0.0067217249142971685
		3 15 0.35524030810228663 16 0.63848878260811726 17 0.0062709092895963155
		3 15 0.34248941873235478 16 0.65428318507729011 17 0.0032273961903551557
		3 15 0.28313063492324803 16 0.71561805371106757 32 0.0012513113656844547
		3 15 0.25638053108096276 16 0.74270769300662565 32 0.00091177591241148011
		3 15 0.35582092209859739 16 0.64376042840110337 17 0.00041864950029908942
		3 15 0.34668371293433714 16 0.65170984410641686 17 0.001606442959246147
		3 15 0.30229500808352322 16 0.69045180232943826 17 0.0072531895870385481
		3 0 0.42210179169158674 1 0.37427617774123739 10 0.20362203056717579
		3 0 0.39734095378192502 1 0.29656842636049657 9 0.30609061985757841
		3 0 0.34708264379830223 9 0.3957727906324886 10 0.25714456556920912
		3 0 0.3715453953649257 9 0.430882583012975 10 0.1975720216220993
		3 0 0.35288620351096955 9 0.38439191588937921 10 0.26272188059965124
		3 0 0.41107705729437988 5 0.32424574328618228 9 0.2646771994194379
		3 0 0.43885569458111279 5 0.38770766388394268 10 0.17343664153494454
		3 0 0.4694094402871658 5 0.3585427824076689 10 0.17204777730516518
		3 0 0.59060077316220072 5 0.27707111152053771 10 0.13232811531726149
		3 0 0.69860312930273893 1 0.1680330538747265 5 0.13336381682253456
		3 0 0.56225410839492862 1 0.30018148062012384 10 0.13756441098494757
		3 0 0.44531764790701578 1 0.35582143746520489 10 0.19886091462777947
		3 0 0.34654220140883196 10 0.31233056943949755 11 0.34112722915167054
		3 0 0.42435731840437352 10 0.28770798315289603 11 0.2879346984427304
		3 0 0.53264975589557417 9 0.21894485620539642 10 0.24840538789902941
		3 0 0.40476570275816193 10 0.30368134838251087 11 0.29155294885932714
		3 0 0.31028779633471465 10 0.34130258234880928 11 0.34840962131647613
		3 0 0.26937388421085234 10 0.35687188506024831 11 0.37375423072889929
		3 9 0.27315279286130201 10 0.39225819813276502 11 0.33458900900593286
		3 9 0.33307838616599067 10 0.41136627265581721 11 0.25555534117819206
		3 0 0.21828553181776855 9 0.39808533057889306 10 0.38362913760333833
		3 9 0.3141449269098493 10 0.41788053281813392 11 0.26797454027201689
		3 0 0.26567247374037783 10 0.38639041374962507 11 0.34793711250999704
		3 0 0.31111474697234731 10 0.32609431760687452 11 0.36279093542077834
		3 0 0.42315731283935587 1 0.51506603447120647 5 0.061776652689437647
		3 0 0.067612484744920084 1 0.92986966041403718 5 0.0025178548410425645
		3 0 0.087409479670739629 1 0.008499918850827657 5 0.90409060147843268
		3 0 0.45284792886573788 1 0.080597729711455485 5 0.46655434142280666
		3 0 0.5697362170349537 1 0.38938404289631534 5 0.04087974006873081
		3 0 0.18484453857424377 1 0.81389920441638175 5 0.0012562570093744251
		3 0 0.5963908027985807 1 0.054946080960274639 5 0.3486631162411446
		3 0 0.1747544421511612 1 0.0022817714068401832 5 0.82296378644199875
		3 0 0.01813898464066983 1 0.97957409563818909 5 0.0022869197211410203
		3 0 0.026044856812129931 1 0.97256337414402849 2 0.0013917690438416785
		3 0 0.019492449112743997 5 0.97944599006169519 6 0.0010615608255608103
		3 0 0.022696071949998273 1 0.0044931272648422397 5 0.97281080078515936
		3 0 0.016405961836889815 1 0.98202051667905665 2 0.001573521484053531
		3 0 0.016522392690099377 5 0.98204977723246589 6 0.0014278300774347996
		3 0 0.30725793568249515 1 0.6776098605494143 9 0.015132203768090513
		3 0 0.46755729816105485 1 0.3807512540441334 9 0.15169144779481186
		3 0 0.49287859225136932 1 0.48888102262406496 9 0.018240385124565672
		3 0 0.22888272064826667 1 0.76976239995295359 9 0.0013548793987797183
		3 0 0.19684412276495161 5 0.80224821764326482 9 0.00090765959178369302
		3 0 0.50575232681828119 5 0.47738342549304041 9 0.01686424768867829
		3 0 0.44864747811192823 5 0.39339181269362539 9 0.15796070919444627
		3 0 0.27742169107065517 5 0.70947348938966104 9 0.013104819539683754
		3 0 0.26110678406796345 1 0.73499357506923335 9 0.0038996408628031846
		3 0 0.46469234241199203 1 0.48214529790299449 9 0.05316235968501342
		3 0 0.23580943274868407 5 0.76172599271973906 9 0.0024645745315768474
		3 0 0.45204537312008813 5 0.49936029075615607 9 0.048594336123755827
		3 0 0.15209485153846433 1 0.82451030381799117 9 0.023394844643544559
		3 0 0.43642587704260083 1 0.39529326548721211 9 0.16828085747018712
		3 0 0.45530540086253185 5 0.35447403910619302 9 0.1902205600312751
		3 0 0.17075915991983318 5 0.79858821310211447 9 0.030652626978052298
		3 0 0.28215218521839791 1 0.67927232714556574 9 0.038575487636036486
		3 0 0.47934750825833361 1 0.26316616739463389 9 0.25748632434703267
		3 0 0.26463543899944714 5 0.69270721310758865 9 0.042657347892964256
		3 0 0.47238950954444608 5 0.25135126501109123 9 0.27625922544446274
		3 0 0.34377428066830062 1 0.51324717073045756 5 0.14297854860124193
		3 0 0.089394756270125858 1 0.88815210988674653 5 0.022453133843127616
		3 0 0.075512333425712383 1 0.91234611050539471 5 0.012141556068892884
		3 0 0.36998462495293372 1 0.49482266432368549 5 0.13519271072338085
		3 0 0.39095877221459979 1 0.16996473735571704 5 0.43907649042968294
		3 0 0.082857039868846211 1 0.021143538560651726 5 0.89599942157050194
		3 0 0.12258021602624797 1 0.037386754091315942 5 0.84003302988243611
		3 0 0.37137335616557388 1 0.18805098749228 5 0.44057565634214607
		3 0 0.25097563683866581 1 0.64194719362363983 5 0.1070771695376945
		3 0 0.049738207109909956 1 0.93620157036524576 5 0.014060222524844176
		3 0 0.28360985979242836 1 0.13789200180842223 5 0.57849813839914932
		3 0 0.072014499518851666 1 0.02460794088287965 5 0.90337755959826871
		3 0 0.057311235047254931 1 0.94182535699358017 2 0.00086340795916502666
		3 0 0.049408228001398588 1 0.0012028982185493234 5 0.94938887378005199
		3 0 0.097064146266198983 1 0.90225973627866118 2 0.00067611745513972046
		3 0 0.075525829501991673 5 0.92393670053754096 6 0.00053746996046721504
		3 0 0.052548387181354093 1 0.93164144812760141 2 0.015810164691044466
		3 0 0.09012110609872892 1 0.9011086020963367 2 0.0087702918049344953
		3 0 0.080692408561553144 5 0.91110014357698421 6 0.0082074478614626127
		3 0 0.070202154975849862 5 0.90855226097817188 6 0.021245584045978368
		3 0 0.067771003082237991 1 0.91827195890029001 2 0.013957038017471982
		3 0 0.071939074492920099 5 0.91210150041206017 6 0.015959425095019721
		3 0 0.14572992041510319 1 0.83839771012560593 9 0.015872369459290825
		3 0 0.13543597391052981 5 0.84761894476611332 9 0.016945081323356797
		3 0 0.19884184423999016 1 0.78669465219192103 9 0.014463503568088881
		3 0 0.17332550333484928 5 0.81415845682248811 9 0.012516039842662464
		3 0 0.077268647192010403 1 0.91789428906033133 2 0.0048370637476582859
		3 0 0.052411424590922212 1 0.94623831972785055 2 0.0013502556812273203
		3 0 0.04314053258448073 5 0.9558660718592682 6 0.00099339555625121349
		3 0 0.073966849369281815 5 0.92219097185255461 6 0.0038421787781635192
		3 0 0.038103734747751521 1 0.95834931129479661 2 0.0035469539574517826
		3 0 0.03716404413503728 5 0.96007093383649933 6 0.0027650220284634597
		3 0 0.17572574530131635 1 0.81891733515561427 9 0.0053569195430694392
		3 0 0.11820965978166005 1 0.88110017447059286 2 0.00069016574774717989
		3 0 0.093714412461754756 5 0.90579777205116674 6 0.00048781548707844697
		3 0 0.1597740085730639 5 0.83673430938470161 9 0.0034916820422346822
		3 0 0.12824574653001902 1 0.87016698118723568 2 0.0015872722827452229
		3 0 0.11545140870630319 5 0.8834224361886247 6 0.0011261551050722417
		3 0 0.016925900593110881 1 0.97295079389689321 2 0.010123305509995836
		3 0 0.032936741286505887 1 0.95314293142164985 2 0.013920327291844245
		3 0 0.050791289972533599 5 0.92916670348246344 6 0.020042006545002943;
	setAttr ".wl[2500:2666].w"
		3 0 0.026979126829951992 5 0.958903639035112 6 0.014117234134936188
		3 0 0.020245533852119742 1 0.97475677254447568 5 0.004997693603404507
		3 0 0.028553839985499284 1 0.0092161348778884537 5 0.96223002513661215
		3 0 0.38984406420832518 1 0.33976674161911335 5 0.27038919417256135
		3 0 0.35568943809016895 1 0.35123522046509731 5 0.29307534144473363
		3 0 0.4738526278541409 1 0.29402186861748908 5 0.23212550352836997
		3 0 0.52598415482827554 1 0.17730855451466157 9 0.29670729065706303
		3 0 0.42938316241032071 1 0.31224230722184243 5 0.25837453036783675
		3 0 0.50114812760538563 1 0.27208613339970422 5 0.22676573899491023
		3 0 0.6109937659607364 1 0.21246249210691479 5 0.17654374193234887
		3 0 0.46315066562457641 1 0.41218929608781474 9 0.12466003828760891
		3 0 0.50770339644800655 1 0.42023387627024833 9 0.072062727281745037
		3 0 0.61832187035104524 1 0.32903861405897733 9 0.052639515589977398
		3 0 0.69091351213397001 1 0.17106420311545972 5 0.13802228475057035
		3 0 0.65015017798277852 5 0.29765350133368706 9 0.052196320683534671
		3 0 0.52448898664134913 5 0.41394210525072217 9 0.061568908107928748
		3 0 0.46860644911041821 5 0.42827040387781201 9 0.10312314701176982
		3 0 0.44834305620787851 5 0.3490722432022027 9 0.20258470058991879
		3 0 0.4524031600590096 5 0.19740124274002843 9 0.35019559720096194
		3 0 0.50355688609961291 1 0.093486173717740997 9 0.40295694018264594
		3 0 0.46083772192715322 1 0.19266811543432502 9 0.34649416263852179
		3 0 0.45372432412509628 1 0.32965867743012905 9 0.21661699844477469
		3 0 0.0043642254903707833 1 0.98455000326563358 2 0.011085771243995521
		3 0 0.0055722617648883144 1 0.97802545015467324 2 0.016402288080438567
		3 0 0.0052396519347086435 1 0.9746245718151747 2 0.020135776250116637
		3 0 0.009761762331888196 1 0.96875175037144234 2 0.021486487296669552
		3 0 0.01540627404658796 1 0.96052486947304749 2 0.024068856480364515
		3 0 0.020990898649324886 1 0.95632973206216276 2 0.022679369288512451
		3 0 0.027068508984926864 1 0.95534772378877364 2 0.017583767226299538
		3 0 0.028686257423105686 1 0.9611261302748566 2 0.010187612302037647
		3 0 0.0088770044586113823 1 0.97949988732881843 2 0.011623108212570149
		3 0 0.012399116239219563 1 0.9824147034557914 2 0.0051861803049891107
		3 0 0.004665787496940005 1 0.98852963885003631 2 0.0068045736530236529
		3 0 0.0028901851644754419 1 0.98922335187030541 2 0.0078864629652191116
		3 0 0.0062118273626914017 5 0.98098744041353658 6 0.01280073222377201
		3 0 0.0089692939501667159 5 0.97440429122520156 6 0.016626414824631786
		3 0 0.0086423200028958452 5 0.96848837598820359 6 0.022869304008900571
		3 0 0.015756856029713426 5 0.95725614904233303 6 0.026986994927953693
		3 0 0.02303072795051329 5 0.94729148197487834 6 0.029677790074608353
		3 0 0.02561155041850249 5 0.94940785470703515 6 0.024980594874462244
		3 0 0.025621610458140584 5 0.95753960829602258 6 0.016838781245836834
		3 0 0.02677913340598588 5 0.96438044808967049 6 0.0088404185043435019
		3 0 0.0082352402587091336 5 0.98148701765460833 6 0.010277742086682647
		3 0 0.010909399066119483 5 0.98477435339685637 6 0.0043162475370242155
		3 0 0.0036795778891047042 5 0.99057321228526241 6 0.0057472098256329046
		3 0 0.0030895104032555398 5 0.9877474255444586 6 0.0091630640522857125
		3 0 0.2462517988154854 1 0.017668775215445177 5 0.73607942596906961
		3 0 0.22912579588639273 1 0.053047788491338101 5 0.71782641562226934
		3 0 0.15873155497940386 1 0.054010733185898288 5 0.78725771183469795
		3 0 0.2383857488711027 1 0.081190608554744428 5 0.68042364257415289
		3 0 0.32528684753876502 5 0.58707307154893218 9 0.087640080912302784
		3 0 0.3967374980476972 5 0.47236004487580224 9 0.13090245707650039
		3 0 0.38485844499912614 5 0.56463856408242152 9 0.05050299091845234
		3 0 0.34283593174573179 5 0.64756551007059915 9 0.0095985581836691269
		3 0 0.34729020301160762 5 0.6477434561786285 9 0.0049663408097639309
		3 0 0.38749679178600782 1 0.012231187635327838 5 0.60027202057866436
		3 0 0.20016134695664581 1 0.78831391948403229 5 0.011524733559321883
		3 0 0.21704561872266154 1 0.73931713051850501 5 0.043637250758833318
		3 0 0.12458000539191583 1 0.83876730033371072 5 0.036652694274373399
		3 0 0.19708423554437121 1 0.74631877859366402 5 0.056596985861964877
		3 0 0.30330545160209993 1 0.62483815786206032 9 0.071856390535839823
		3 0 0.40954741057343491 1 0.47541139134286031 9 0.11504119808370475
		3 0 0.41319777498817595 1 0.53852842600492856 9 0.048273799006895657
		3 0 0.37494718451524928 1 0.61382861628186891 9 0.011224199202882033
		3 0 0.36687387308403102 1 0.6273103815192278 9 0.0058157453967412568
		3 0 0.36898792399924418 1 0.62266237744102537 5 0.0083496985597305319
		3 12 0.11618105209342319 36 0.44190947395328839 37 0.44190947395328839
		3 12 0.11524504746914138 36 0.44237747626542934 37 0.44237747626542934
		3 12 0.11311439138121419 36 0.44344280430939298 37 0.44344280430939298
		3 12 0.11415957454276919 36 0.44292021272861537 37 0.44292021272861537
		3 12 0.13493251409198886 36 0.4325337429540056 37 0.4325337429540056
		3 12 0.13659840491689851 36 0.43170079754155077 37 0.43170079754155077
		3 12 0.13028903321620525 36 0.43485548339189734 37 0.43485548339189734
		3 12 0.13059440680609122 36 0.43470279659695438 37 0.43470279659695438
		3 12 0.11215530736780072 36 0.44392234631609967 37 0.44392234631609967
		3 12 0.11167227264822967 36 0.44416386367588512 37 0.44416386367588512
		3 12 0.13553212144796672 36 0.43223393927601661 37 0.43223393927601661
		3 12 0.13810230709530813 36 0.43094884645234594 37 0.43094884645234594
		3 12 0.11302837339655651 36 0.44348581330172171 37 0.44348581330172171
		3 12 0.11151128551765518 36 0.44424435724117245 37 0.44424435724117245
		3 12 0.13248276754969066 36 0.43375861622515466 37 0.43375861622515466
		3 12 0.13414332716480923 36 0.43292833641759537 37 0.43292833641759537
		3 12 0.11333364510118184 36 0.44333317744940909 37 0.44333317744940909
		3 12 0.11065329332330369 36 0.44467335333834818 37 0.44467335333834818
		3 12 0.12650169311249024 36 0.43674915344375481 37 0.43674915344375481
		3 12 0.13069502624148563 36 0.43465248687925717 37 0.43465248687925717
		3 12 0.10826985944866338 36 0.44586507027566835 37 0.44586507027566835
		3 12 0.10429629930489262 36 0.44785185034755365 37 0.44785185034755365
		3 12 0.11809627084930324 36 0.4409518645753483 37 0.4409518645753483
		3 12 0.12434015764391677 36 0.43782992117804159 37 0.43782992117804159
		3 12 0.10049540574425979 36 0.44975229712787013 37 0.44975229712787013
		3 12 0.096060601953621261 36 0.4519696990231894 37 0.4519696990231894
		3 12 0.10984959184889126 36 0.44507520407555434 37 0.44507520407555434
		3 12 0.11498721082223863 36 0.44250639458888064 37 0.44250639458888064
		3 12 0.095780975704614843 36 0.45210951214769257 37 0.45210951214769257
		3 12 0.092438495265174919 36 0.4537807523674125 37 0.4537807523674125
		3 12 0.10559235798469217 36 0.44720382100765388 37 0.44720382100765388
		3 12 0.10978087212719197 36 0.44510956393640405 37 0.44510956393640405
		3 12 0.11161889940149623 36 0.44419055029925192 37 0.44419055029925192
		3 12 0.10949868134043009 36 0.44525065932978497 37 0.44525065932978497
		3 12 0.12161982638486885 36 0.43919008680756555 37 0.43919008680756555
		3 12 0.12137177186767731 36 0.43931411406616133 37 0.43931411406616133
		3 12 0.098043967493212023 36 0.45097801625339395 37 0.45097801625339395
		3 12 0.097514089313160537 36 0.45124295534341974 37 0.45124295534341974
		3 12 0.10841001912397251 36 0.44579499043801374 37 0.44579499043801374
		3 12 0.10417269342467025 36 0.44791365328766486 37 0.44791365328766486
		3 12 0.081879954546110315 36 0.45906002272694485 37 0.45906002272694485
		3 12 0.08167489943288106 36 0.45916255028355946 37 0.45916255028355946
		3 12 0.091262745775667189 36 0.45436862711216641 37 0.45436862711216641
		3 12 0.083576173913014015 36 0.45821191304349301 37 0.45821191304349301
		3 12 0.072328043208713153 36 0.46383597839564339 37 0.46383597839564339
		3 12 0.070324390047903848 36 0.46483780497604799 37 0.46483780497604799
		3 12 0.08107852511322064 36 0.45946073744338972 37 0.45946073744338972
		3 12 0.073415368511249079 36 0.4632923157443754 37 0.4632923157443754
		3 12 0.095279928218883023 36 0.45236003589055845 37 0.45236003589055845
		3 12 0.09982614506551149 36 0.45008692746724421 37 0.45008692746724421
		3 12 0.10647495453558702 36 0.44676252273220646 37 0.44676252273220646
		3 12 0.11342834322451983 36 0.44328582838774011 37 0.44328582838774011
		3 12 0.11436489041288421 36 0.44281755479355789 37 0.44281755479355789
		3 12 0.11413217579776676 36 0.4429339121011166 37 0.4429339121011166
		3 12 0.11661775065785478 36 0.44169112467107263 37 0.44169112467107263
		3 12 0.11757863971614109 36 0.44121068014192938 37 0.44121068014192938
		3 12 0.11427628680366751 36 0.44286185659816624 37 0.44286185659816624
		3 12 0.10412231982811855 36 0.4479388400859407 37 0.4479388400859407
		3 12 0.085723617573144659 36 0.45713819121342758 37 0.45713819121342758
		3 12 0.071710424502213377 36 0.46414478774889334 37 0.46414478774889334
		3 12 0.10832901127786651 36 0.44583549436106668 37 0.44583549436106668
		3 12 0.11447701815900291 36 0.4427614909204986 37 0.4427614909204986
		3 12 0.12175624657682084 36 0.43912187671158953 37 0.43912187671158953
		3 12 0.13007541890576499 36 0.43496229054711749 37 0.43496229054711749
		3 12 0.13576908274475755 36 0.43211545862762119 37 0.43211545862762119
		3 12 0.13888708640133673 36 0.43055645679933169 37 0.43055645679933169
		3 12 0.13609265661786157 36 0.4319536716910693 37 0.4319536716910693
		3 12 0.12983786852295115 36 0.4350810657385244 37 0.4350810657385244
		3 12 0.12451159884677912 36 0.4377442005766104 37 0.4377442005766104
		3 12 0.11361335183293723 36 0.4431933240835314 37 0.4431933240835314
		3 12 0.091413911236480058 36 0.45429304438175999 37 0.45429304438175999
		3 12 0.076169429710035222 36 0.46191528514498242 37 0.46191528514498242
		3 12 0.073588489305526653 36 0.46320575534723668 37 0.46320575534723668
		3 12 0.081412921117963222 36 0.45929353944101836 37 0.45929353944101836
		3 12 0.079533131098561999 36 0.46023343445071901 37 0.46023343445071901
		3 12 0.091520779787979331 36 0.45423961010601033 37 0.45423961010601033
		3 12 0.10932646087734091 36 0.44533676956132956 37 0.44533676956132956
		3 12 0.10748994258536217 36 0.44625502870731892 37 0.44625502870731892
		3 12 0.12876744899279538 36 0.43561627550360238 37 0.43561627550360238
		3 12 0.12763032778998154 36 0.43618483610500919 37 0.43618483610500919
		3 12 0.11077702105261913 36 0.44461148947369045 37 0.44461148947369045
		3 12 0.12449299385464763 36 0.43775350307267624 37 0.43775350307267624
		3 12 0.10772711249826002 36 0.44613644375087003 37 0.44613644375087003
		3 12 0.12660720816712409 36 0.43669639591643794 37 0.43669639591643794
		3 12 0.10600142354128385 36 0.44699928822935808 37 0.44699928822935808
		3 12 0.12121902258662304 36 0.43939048870668851 37 0.43939048870668851
		3 12 0.099511286002233246 36 0.45024435699888332 37 0.45024435699888332
		3 12 0.11161475079909189 36 0.44419262460045411 37 0.44419262460045411
		3 12 0.091248931337586936 36 0.45437553433120653 37 0.45437553433120653
		3 12 0.10317347558623892 36 0.4484132622068806 37 0.4484132622068806
		3 12 0.087925797685943011 36 0.45603710115702856 37 0.45603710115702856
		3 12 0.10016490086877433 36 0.44991754956561286 37 0.44991754956561286
		3 12 0.10481790245754957 36 0.44759104877122519 37 0.44759104877122519
		3 12 0.11280447682531916 36 0.44359776158734038 37 0.44359776158734038
		3 12 0.093513110428322915 36 0.45324344478583856 37 0.45324344478583856
		3 12 0.097428994335871405 36 0.45128550283206426 37 0.45128550283206426
		3 12 0.080924152622313492 36 0.45953792368884328 37 0.45953792368884328
		3 12 0.082348417723206863 36 0.45882579113839655 37 0.45882579113839655
		3 12 0.072061702970408772 36 0.46396914851479559 37 0.46396914851479559
		3 12 0.073553534174216728 36 0.46322323291289164 37 0.46322323291289164
		2 12 0.10286102817558836 36 0.4485694859122058;
	setAttr ".wl[2666:2833].w"
		1 37 0.4485694859122058
		3 12 0.10214089718164092 36 0.44892955140917956 37 0.44892955140917956
		3 12 0.1147648232413508 36 0.44261758837932463 37 0.44261758837932463
		3 12 0.11649767481656481 36 0.44175116259171759 37 0.44175116259171759
		3 12 0.09144210271310993 36 0.45427894864344504 37 0.45427894864344504
		3 12 0.094013838780205347 36 0.45299308060989729 37 0.45299308060989729
		3 12 0.097659530412084347 36 0.45117023479395785 37 0.45117023479395785
		3 12 0.1040488467971409 36 0.44797557660142956 37 0.44797557660142956
		3 12 0.079263237822524965 36 0.46036838108873751 37 0.46036838108873751
		3 12 0.084691877130919038 36 0.45765406143454052 37 0.45765406143454052
		3 12 0.084062336410477528 36 0.45796883179476128 37 0.45796883179476128
		3 12 0.093962073237721433 36 0.45301896338113923 37 0.45301896338113923
		3 12 0.076797323132351325 36 0.46160133843382434 37 0.46160133843382434
		3 12 0.082340671473619509 36 0.45882966426319027 37 0.45882966426319027
		3 12 0.099393902642724172 36 0.45030304867863791 37 0.45030304867863791
		3 12 0.10445662225503693 36 0.44777168887248159 37 0.44777168887248159
		3 12 0.10881551092721928 36 0.44559224453639035 37 0.44559224453639035
		3 12 0.10802940016046325 36 0.44598529991976832 37 0.44598529991976832
		3 12 0.13373535276442297 36 0.43313232361778853 37 0.43313232361778853
		3 12 0.13256722525688633 36 0.43371638737155688 37 0.43371638737155688
		3 12 0.10975174761475112 36 0.44512412619262443 37 0.44512412619262443
		3 12 0.12820939922450067 36 0.43589530038774971 37 0.43589530038774971
		3 12 0.10878551001261116 36 0.44560724499369436 37 0.44560724499369436
		3 12 0.13074456229652553 36 0.43462771885173723 37 0.43462771885173723
		3 12 0.10856770599796203 36 0.44571614700101897 37 0.44571614700101897
		3 12 0.12826150475130046 36 0.43586924762434975 37 0.43586924762434975
		3 12 0.099485605312945355 36 0.45025719734352737 37 0.45025719734352737
		3 12 0.10506217041143608 36 0.44746891479428191 37 0.44746891479428191
		3 12 0.12342253663769213 36 0.43828873168115395 37 0.43828873168115395
		3 12 0.11609869758907902 36 0.44195065120546051 37 0.44195065120546051
		3 12 0.091040208332556438 36 0.45447989583372173 37 0.45447989583372173
		3 12 0.10903987536217442 36 0.44548006231891285 37 0.44548006231891285
		3 12 0.10420100977861126 36 0.44789949511069438 37 0.44789949511069438
		3 12 0.11872474333611437 36 0.44063762833194281 37 0.44063762833194281
		3 12 0.080233530278397053 36 0.45988323486080152 37 0.45988323486080152
		3 12 0.093795073593152103 36 0.45310246320342396 37 0.45310246320342396
		3 12 0.10858235450449462 36 0.4457088227477527 37 0.4457088227477527
		3 12 0.095900685943102776 36 0.45204965702844863 37 0.45204965702844863
		3 12 0.071689923739691311 36 0.4641550381301543 37 0.4641550381301543
		3 12 0.089690432911357074 36 0.45515478354432143 37 0.45515478354432143
		3 12 0.10324915430265544 36 0.44837542284867227 37 0.44837542284867227
		3 12 0.10332947074054022 36 0.44833526462972989 37 0.44833526462972989
		3 12 0.12391967912647012 36 0.43804016043676491 37 0.43804016043676491
		3 12 0.12547371353425668 36 0.43726314323287163 37 0.43726314323287163
		3 12 0.093452758222516072 36 0.45327362088874196 37 0.45327362088874196
		3 12 0.097418994098853545 36 0.45129050295057327 37 0.45129050295057327
		3 12 0.11352212693793867 36 0.44323893653103069 37 0.44323893653103069
		3 12 0.11872384974427808 36 0.44063807512786102 37 0.44063807512786102
		3 12 0.082843137523825855 36 0.45857843123808711 37 0.45857843123808711
		3 12 0.089735215274208996 36 0.45513239236289549 37 0.45513239236289549
		3 12 0.10409769984565859 36 0.44795115007717068 37 0.44795115007717068
		3 12 0.11088707086184633 36 0.44455646456907688 37 0.44455646456907688
		3 28 0.074204597286125204 32 0.45758025290859677 33 0.4682151498052779
		3 28 0.10659735100455492 32 0.41765081526495401 33 0.47575183373049101
		3 28 0.12451802569993604 32 0.38161577056447493 33 0.49386620373558893
		3 28 0.12520181320204493 32 0.33865857134357208 33 0.53613961545438305
		3 28 0.11542596791033648 32 0.27188794718357417 33 0.61268608490608945
		3 16 0.020722366526634936 32 0.4896394366120243 33 0.48963819686134075
		3 28 0.041437040082164645 32 0.47883388229140827 33 0.47972907762642719
		3 28 0.07001182081741604 32 0.46066600681856129 33 0.46932217236402274
		3 28 0.09684154935795114 32 0.43537011382930374 33 0.46778833681274506
		3 28 0.11974259394452377 32 0.38556439065479881 33 0.49469301540067739
		3 28 0.13542197371279421 32 0.32873941152281511 33 0.53583861476439076
		3 28 0.12070198815552365 32 0.27524529877044296 33 0.60405271307403352
		3 28 0.087371455867339964 32 0.20037912574862135 33 0.71224941838403877
		3 16 0.017237392474555149 32 0.49138199813164046 33 0.49138060939380435
		3 28 0.025125742170699735 32 0.48735781021722197 33 0.4875164476120783
		3 28 0.050259093734759661 32 0.47107459014507735 33 0.47866631612016297
		3 28 0.08211759033431551 32 0.4378203495733004 33 0.48006206009238417
		3 28 0.084846464899109603 32 0.37799783477934096 33 0.53715570032154947
		3 28 0.11282090912399761 32 0.31775668563997161 33 0.56942240523603072
		3 28 0.084980794240600274 32 0.22502606725491378 33 0.68999313850448596
		3 28 0.05050759504276825 32 0.13631180823358749 33 0.81318059672364418
		3 16 0.019365961646812313 32 0.49031774089932567 33 0.49031629745386185
		3 28 0.031142493678037432 32 0.48118425960581362 33 0.48767324671614903
		3 28 0.054976759692100224 32 0.44431782071935355 33 0.5007054195885462
		3 28 0.069098338435679765 32 0.27271149321166965 33 0.65819016835265043
		3 28 0.045002953445830315 32 0.16819117110473661 33 0.78680587544943303
		3 28 0.027788201217548686 32 0.10572822227340022 33 0.86648357650905106
		3 16 0.051530133637316393 32 0.47393956270501958 33 0.47453030365766402
		3 16 0.070982406850375435 32 0.46199572591890148 33 0.4670218672307232
		3 28 0.080793306896204856 32 0.43658086104352589 33 0.48262583206026921
		3 28 0.09811631535240202 32 0.36762700968919804 33 0.5342566749583999
		3 28 0.090444069387573475 32 0.27372425781673321 33 0.63583167279569319
		3 28 0.07917247056851158 32 0.2018838085796183 33 0.71894372085187019
		3 16 0.035253994129497736 32 0.48237389442577561 33 0.48237211144472675
		3 32 0.13324192368740925 33 0.81019312847602087 34 0.056564947836569866
		3 16 0.024336601949787661 32 0.48783281003042211 33 0.48783058801979007
		3 28 0.043921645689181069 32 0.35303359564142511 33 0.60304475866939367
		3 32 0.089264104799203811 33 0.86976291764082914 34 0.040972977559967053
		3 16 0.021017422256715806 32 0.48949234482231152 33 0.48949023292097266
		3 16 0.025809518971836677 32 0.48691280433039663 33 0.48727767669776662
		3 16 0.026504595207399444 32 0.48480852010339254 33 0.48868688468920818
		3 28 0.031206914267281904 32 0.46094224105629727 33 0.50785084467642083
		3 28 0.034125373264416788 32 0.20906005931219654 33 0.75681456742338671
		3 28 0.023761008107567028 32 0.13101010346548264 33 0.84522888842695021
		3 32 0.090813176345274485 33 0.88322967081990256 34 0.025957152834822778
		3 16 0.059239261121203778 32 0.47038137681871289 33 0.47037936206008352
		3 16 0.074561761788409925 32 0.46077906038285465 33 0.46465917782873539
		3 16 0.077955699453768304 32 0.44478618073081577 33 0.47725811981541588
		3 16 0.067103230763267463 32 0.39426468590932895 33 0.53863208332740353
		3 28 0.063497673145090638 32 0.28587947100566913 33 0.65062285584924018
		3 32 0.17593772096409022 33 0.75949752580034813 34 0.064564753235561767
		3 16 0.03996712248418887 32 0.4800176973350363 33 0.48001518018077483
		3 32 0.10579297254185829 33 0.83463468811463204 34 0.059572339343509667
		3 16 0.029166914710395613 32 0.48541800745891389 33 0.48541507783069049
		3 28 0.02907569331921674 32 0.33753408050885431 33 0.63339022617192886
		3 32 0.086430402328242562 33 0.87221396787139094 34 0.041355629800366438
		3 16 0.025279073050992563 32 0.48736187924568636 33 0.48735904770332117
		3 16 0.029514094414853077 32 0.48501073115949472 33 0.48547517442565224
		3 16 0.034045792191606312 32 0.47698040031344857 33 0.48897380749494518
		3 16 0.035372627313358843 32 0.43337504085657796 33 0.53125233183006315
		3 28 0.025365377750824442 32 0.23074046718851116 33 0.74389415506066436
		3 28 0.017909839176818671 32 0.13748662135749318 33 0.84460353946568822
		3 32 0.091321450732033849 33 0.88175447480478319 34 0.02692407446318287
		3 16 0.059174760214756629 32 0.46939967913352665 33 0.47142556065171665
		3 16 0.070875261060448475 32 0.45217762137795942 33 0.47694711756159203
		3 16 0.068710092949499882 32 0.42117024139382198 33 0.51011966565667799
		3 16 0.054855638023255424 32 0.35484506613852157 33 0.59029929583822305
		3 28 0.0509241782107797 32 0.27071759856950012 33 0.67835822321972006
		3 32 0.195260914880209 33 0.74110051358475815 34 0.063638571535032842
		3 16 0.040874397285237118 32 0.47956417913758154 33 0.47956142357718134
		3 16 0.051459845282578152 32 0.47246250884406304 33 0.47607764587335877
		3 16 0.061076852960197714 32 0.45981451160746217 33 0.47910863543234022
		3 16 0.059109346568615675 32 0.41834135123173555 33 0.52254930219964879
		3 16 0.045362595240946352 32 0.32543535960194886 33 0.62920204515710487
		3 32 0.22581472643893954 33 0.7233375341842293 34 0.050847739376831118
		3 32 0.16883461512798445 33 0.77063270164713127 34 0.060532683224884323
		3 32 0.12969292996933812 33 0.8109516656061394 34 0.059355404424522459
		3 16 0.032542455594865148 32 0.48373026997129365 33 0.48372727443384134
		3 16 0.041718718640363764 32 0.47733435541861985 33 0.48094692594101635
		3 16 0.05155461437398566 32 0.45475580538889993 33 0.49368958023711446
		3 16 0.049644797053732106 32 0.40141222480897387 33 0.54894297813729409
		3 16 0.03748117702374177 32 0.32945843335089575 33 0.63306038962536249
		3 28 0.037737956667340075 32 0.25005153129457369 33 0.71221051203808616
		3 32 0.16470036575884395 33 0.79561675901652684 34 0.039682875224629321
		3 32 0.10781432470078924 33 0.85021808692936085 34 0.041967588369849922
		3 16 0.028471923179863939 32 0.48576557489947719 33 0.48576250192065878
		3 16 0.034555966088082278 32 0.48188488473126651 33 0.48355914918065118
		3 16 0.042315469283879761 32 0.46577265768273141 33 0.49191187303338874
		3 16 0.043110052035973748 32 0.41619716530745227 33 0.54069278265657406
		3 28 0.027652034005434502 32 0.23648039784195937 33 0.73586756815260612
		3 32 0.16444184879888488 33 0.81478855364604574 34 0.020769597555069425
		3 32 0.11193105253563142 33 0.85911260968912651 34 0.028956337775242046
		3 24 0.15336368477320103 28 0.67855269325834289 29 0.16808362196845611
		3 24 0.13672467356640836 28 0.66354185347560424 29 0.19973347295798743
		3 24 0.12451062114416256 28 0.66005644658033968 29 0.21543293227549781
		3 24 0.11258987300178831 28 0.66544870360685271 29 0.22196142339135899
		3 24 0.10320716420758065 28 0.6730660762252938 29 0.22372675956712557
		3 16 0.11264107008279278 24 0.20640286087950807 28 0.68095606903769923
		3 24 0.19062041413680816 28 0.69640902119652215 29 0.1129705646666697
		3 24 0.16222700247719915 28 0.6986698000968542 29 0.13910319742594673
		3 24 0.14468018492318291 28 0.68554878170939593 29 0.16977103336742111
		3 24 0.11240508190306114 28 0.69883589793562573 29 0.18875902016131307
		3 24 0.099140395320479371 28 0.69560187245047322 29 0.20525773222904745
		3 24 0.08985686793280942 28 0.69797159721039304 29 0.21217153485679752
		3 24 0.089403587241832436 28 0.67833786793424866 29 0.23225854482391883
		3 16 0.095191319137673008 24 0.17831453721611867 28 0.72649414364620835
		3 24 0.17904888377250294 28 0.73927435460587421 29 0.081676761621622837
		3 24 0.14377639638785208 28 0.74634405696172734 29 0.1098795466504207
		3 24 0.11868809903259123 28 0.73709039926054565 29 0.14422150170686315
		3 24 0.076248353957859907 28 0.76053809717311094 29 0.16321354886902911
		3 24 0.079980954952341532 28 0.72360530590610639 29 0.19641373914155211
		3 24 0.073021125839034071 28 0.68941931772825138 29 0.23755955643271462
		3 24 0.069068982719666841 28 0.65070190155128249 29 0.28022911572905063
		3 24 0.1230020270064551 28 0.80650331307058132 29 0.070494659922963804
		3 24 0.10479134554011621 28 0.80389270922656997 29 0.091315945233313919
		1 24 0.083488794404950481;
	setAttr ".wl[2833:2999].w"
		2 28 0.79505991035468615 29 0.12145129524036333
		3 24 0.057278200020128768 28 0.7272612661646255 29 0.21546053381524558
		3 24 0.055143071974776699 28 0.65001756010323675 29 0.29483936792198667
		3 24 0.052280992698996442 28 0.61146350654469017 29 0.33625550075631333
		3 24 0.15236233270625166 28 0.70106797879124938 29 0.14656968850249902
		3 24 0.10887512591348679 28 0.70595204185050975 29 0.18517283223600342
		3 24 0.11366261373474845 28 0.6764350812277995 29 0.20990230503745211
		3 24 0.11051664903472477 28 0.6579901547253274 29 0.23149319623994771
		3 24 0.099892310829703096 28 0.65930623993598514 29 0.24080144923431168
		3 24 0.094967545230505837 28 0.66948375647283387 29 0.23554869829666022
		3 16 0.11209728520370998 24 0.1798861230254703 28 0.70801659177081977
		3 24 0.075113897380303843 28 0.67810848134055024 29 0.24677762127914593
		3 16 0.11032824148970949 24 0.15937497322311822 28 0.73029678528717223
		3 24 0.040604430096458179 28 0.802216422520173 29 0.15717914738336886
		3 24 0.053894511585349608 28 0.65322619640126545 29 0.29287929201338481
		3 16 0.073953306766833732 24 0.12460867899741149 28 0.80143801423575478
		3 24 0.0706969821746843 28 0.8624412984279336 29 0.066861719397382072
		3 24 0.066317958419748413 28 0.85253937360411225 29 0.081142667976139352
		3 24 0.05018878137085183 28 0.84569122476288539 29 0.10411999386626274
		3 24 0.038664209129187645 28 0.71004647820374867 29 0.25128931266706367
		3 24 0.041174418327281692 28 0.62839283232005194 29 0.33043274935266653
		3 24 0.038056965951111271 28 0.6311971678389604 29 0.33074586620992841
		3 24 0.11606712683292222 28 0.73052715552383296 29 0.1534057176432449
		3 28 0.7224428850867235 29 0.18946761931329639 33 0.088089495599980236
		3 28 0.70315800597320632 29 0.21626966281509061 33 0.080572331211702944
		3 28 0.68213713250255048 29 0.2390295523587945 33 0.078833315138655075
		3 28 0.66794230870574445 29 0.24970895858936645 33 0.082348732704889058
		3 24 0.068364153917029075 28 0.68808061214046912 29 0.24355523394250178
		3 16 0.11876259411264438 24 0.13648732487723958 28 0.74475008101011597
		3 24 0.051294953042340573 28 0.69998531319035362 29 0.2487197337673058
		3 16 0.1175003163470012 28 0.76830739039334162 32 0.11419229325965728
		3 28 0.78741848432635519 29 0.14497438297049661 33 0.067607132703148012
		3 28 0.68546824962949093 29 0.27215354822374166 33 0.042378202146767345
		3 16 0.07638129601551627 24 0.089520151129462155 28 0.83409855285502155
		3 28 0.85713501494544531 29 0.06598233379631549 32 0.076882651258238996
		3 28 0.852837499035211 29 0.08358998374812196 32 0.063572517216667165
		3 28 0.82416551955571637 29 0.11334376623492247 33 0.062490714209361184
		3 28 0.76324017846026415 29 0.19587043130260601 33 0.040889390237129793
		3 28 0.68970026392132189 29 0.27849500898628421 33 0.031804727092393875
		3 28 0.66713116078434509 29 0.2986516761461116 33 0.034217163069543345
		3 28 0.71186402935405058 29 0.15827830996794659 32 0.12985766067800295
		3 28 0.6872732794588321 29 0.19756082270098707 33 0.11516589784018083
		3 28 0.67339256037968764 29 0.22246399773129455 33 0.10414344188901782
		3 28 0.65518509209927989 29 0.23145918608892813 33 0.11335572181179199
		3 28 0.64806014349509544 29 0.23522163024490239 33 0.11671822626000224
		3 28 0.66940150712647106 29 0.23640020604949452 33 0.094198286824034444
		3 28 0.70742767694727215 32 0.16150430529103721 33 0.13106801776169061
		3 28 0.66509129941334766 32 0.17587788370336688 33 0.15903081688328535
		3 28 0.67208645491349572 29 0.17274413027382249 33 0.15516941481268168
		3 28 0.66063200567174019 29 0.19382363674529191 33 0.14554435758296791
		3 28 0.66115494369184147 29 0.19796656755002537 33 0.14087848875813322
		3 28 0.66305133277857042 29 0.21414248603538147 33 0.12280618118604805
		3 28 0.6822938384857965 29 0.21965194852347422 33 0.098054212990729223
		3 28 0.69979477902316645 29 0.22971009713998111 33 0.070495123836852552
		3 28 0.72671000686846632 32 0.15648053439761292 33 0.11680945873392058
		3 28 0.68403336240732981 32 0.17221091321792328 33 0.14375572437474676
		3 28 0.6804040754914783 32 0.16065861028067491 33 0.15893731422784677
		3 28 0.68894254128065091 29 0.15894383477982274 33 0.15211362393952643
		3 28 0.72372797315527226 29 0.15716944149462836 33 0.1191025853500994
		3 28 0.69621347673293854 29 0.1832028016440618 33 0.12058372162299955
		3 28 0.7072325013903854 29 0.20502563571830368 33 0.087741862891310987
		3 28 0.70742185455576378 29 0.22945274035357038 33 0.063125405090665818
		3 16 0.085538040747139873 28 0.80053860088667916 32 0.11392335836618088
		3 28 0.77549884764841825 32 0.12704621176523659 33 0.097454940586345351
		3 28 0.76392625025561578 32 0.12405286095485751 33 0.1120208887895266
		3 28 0.7524763242081931 29 0.129357733700701 33 0.11816594209110602
		3 28 0.74578191691252338 29 0.17292768171703796 33 0.081290401370438622
		3 28 0.73072422605027276 29 0.21187519771758814 33 0.057400576232139101
		3 28 0.70076984216687666 29 0.2470478988379862 33 0.052182258995136982
		3 16 0.13076304920332443 20 0.6573912456142218 21 0.2118457051824538
		3 16 0.11351185313327961 20 0.57696372131882634 21 0.30952442554789411
		3 16 0.091234509508072104 20 0.52883836136144313 21 0.37992712913048476
		3 16 0.064951491490376698 20 0.50359451734935479 21 0.43145399116026839
		3 20 0.48167152501642019 21 0.47513637513464874 24 0.043192099848931124
		3 16 0.10753859262807623 20 0.78075270448989842 21 0.11170870288202533
		3 16 0.11740869542634215 20 0.74086612466867341 21 0.14172517990498446
		3 16 0.11957196934780899 20 0.6874879244955272 21 0.19294010615666368
		3 16 0.11739213308034206 20 0.61676954968589459 21 0.26583831723376317
		3 16 0.080501031733540923 20 0.54227370066210445 21 0.37722526760435471
		3 16 0.049059574693315164 20 0.49368657054182108 21 0.4572538547648638
		3 20 0.48342501453668524 21 0.48340555984965256 24 0.033169425613662179
		3 20 0.4631201563679791 21 0.51160534685442161 24 0.025274496777599395
		3 16 0.099947586419845774 20 0.79689993068663911 21 0.10315248289351513
		3 16 0.099732217762565606 20 0.78105287768200304 21 0.11921490455543141
		3 16 0.096728163689161845 20 0.73478674758916618 21 0.16848508872167201
		3 16 0.09230398747691182 20 0.64355819394581226 21 0.26413781857727586
		3 16 0.051589525695972333 20 0.56974235807944995 21 0.3786681162245778
		3 16 0.036647041509997785 20 0.50484145590607965 21 0.4585115025839227
		3 20 0.48202644961707319 21 0.49861954091289878 24 0.019354009470028053
		3 20 0.43414221821100474 21 0.55164479969508151 25 0.014212982093913735
		3 16 0.086880341429393868 20 0.80361774833720356 21 0.10950191023340269
		3 16 0.076295943407667946 20 0.76635675809097181 21 0.15734729850136026
		3 16 0.06522492684640406 20 0.67995800665489481 21 0.25481706649870134
		3 16 0.02007487766146511 20 0.51211462458895751 21 0.46781049774957739
		3 20 0.47355671381555525 21 0.51660055613878675 24 0.0098427300456579783
		3 20 0.41769293230845039 21 0.57409696391225373 25 0.0082101037792957528
		3 16 0.13009086553801269 20 0.71144353739157262 21 0.15846559707041449
		3 16 0.13263405262444039 20 0.66167265084328697 21 0.20569329653227261
		3 16 0.1189494316658489 20 0.60286593721496873 21 0.27818463111918257
		3 16 0.08603620861597315 20 0.54187549785324474 21 0.3720882935307821
		3 20 0.48921527056001857 21 0.4510278621786532 24 0.059756867261328228
		3 20 0.45900711428753133 21 0.50533490304180029 24 0.035657982670668421
		3 16 0.11370887045296195 20 0.76590983216684272 21 0.12038129738019547
		3 20 0.40215658184834285 21 0.57524019603297072 25 0.022603222118686369
		3 16 0.095514429628329414 20 0.80818981976079773 21 0.096295750610872782
		3 16 0.031077028979948407 20 0.59033752024079666 21 0.37858545077925493
		3 20 0.35052535189198142 21 0.63594914330929042 25 0.013525504798728152
		3 16 0.089348978606995755 20 0.81718192608318918 21 0.093469095309815134
		3 16 0.073833683960523241 20 0.82633046289627188 21 0.099835853143204756
		3 16 0.06688085460466732 20 0.79024583058955489 21 0.142873314805778
		3 16 0.051790141957282688 20 0.72061668434876391 21 0.22759317369395338
		3 20 0.48535960649722959 21 0.50220839268820017 24 0.012432000814570352
		3 20 0.43761724021266624 21 0.55564515082565691 24 0.0067376089616768935
		3 20 0.353924072632884 21 0.63751286212977953 24 0.0085630652373365566
		3 16 0.12451018802110619 20 0.72194375241662367 21 0.15354605956226994
		3 16 0.12358638743261226 20 0.67156812266498689 21 0.2048454899024007
		3 16 0.113619597710387 20 0.62244622831661922 21 0.26393417397299368
		3 20 0.57446559208778192 21 0.32817862900604822 24 0.097355778906169935
		3 20 0.51652786992745947 21 0.40193382708246456 24 0.081538302990075973
		3 20 0.42912985694224343 21 0.52515784644405905 24 0.045712296613697571
		3 16 0.1021761234186959 20 0.78527476268073815 21 0.11254911390056584
		3 20 0.33458420737986472 21 0.64020067441778039 24 0.025215118202354912
		3 16 0.078778823059331302 20 0.83942809121582518 21 0.081793085724843492
		3 20 0.607240704977968 21 0.35619325468966073 24 0.036566040332371159
		3 20 0.29418897305494762 21 0.68553827418408264 24 0.020272752760969872
		3 16 0.07471789718812237 20 0.84699903827877543 21 0.078283064533102353
		3 16 0.062191556851843278 20 0.85221189961085997 21 0.085596543537296801
		3 16 0.054546036261681967 20 0.79494854666982551 21 0.15050541706849252
		3 16 0.039079999170235954 20 0.70263738966741573 21 0.2582826111623483
		3 20 0.48931755012104117 21 0.48639711358031934 24 0.024285336298639503
		3 20 0.3860315099607608 21 0.60109436422242313 24 0.012874125816816054
		3 20 0.30161769122432364 21 0.68558238931825977 24 0.012799919457416521
		3 16 0.10790466227375498 20 0.72423048029149939 21 0.16786485743474561
		3 16 0.10069633472584122 20 0.65507274557778072 21 0.24423091969637814
		3 20 0.61000616145996933 21 0.29802771546839357 24 0.091966123071637082
		3 20 0.57588506591421318 21 0.33272117616750835 24 0.091393757918278515
		3 20 0.54174619816324987 21 0.3738756935299013 24 0.084378108306848901
		3 20 0.47328087409690872 21 0.46016774546779149 24 0.066551380435299914
		3 16 0.087688228623216055 20 0.800294988784096 21 0.11201678259268792
		3 16 0.086813673475400782 20 0.75390048214460814 21 0.15928584437999124
		3 16 0.086138509265626606 20 0.69692135932582955 21 0.2169401314085439
		3 20 0.64969466970095424 21 0.27743377504025113 24 0.072871555258794699
		3 20 0.59753815390714471 21 0.32910794076706545 24 0.073353905325789864
		3 20 0.51883069424549355 21 0.41093594656889354 24 0.070233359185612868
		3 20 0.44791617835909869 21 0.49293800119789788 24 0.059145820443003268
		3 20 0.36947909508249199 21 0.58814099557919453 24 0.042379909338313433
		3 16 0.067579004199461543 20 0.84907574915829476 21 0.083345246642243589
		3 16 0.066731094275874661 20 0.80677253527305903 21 0.12649637045106635
		3 16 0.058544156622964333 20 0.73414664282218722 21 0.2073092005548485
		3 20 0.6753389805047646 21 0.27017627290175505 24 0.054484746593480224
		3 20 0.62053031921058988 21 0.32655550492421631 24 0.052914175865193862
		3 20 0.54483777819624568 21 0.39430313960735647 24 0.060859082196397789
		3 20 0.42004853007849741 21 0.53250994608460467 24 0.0474415238368978
		3 20 0.31903656142387454 21 0.64679760230850691 24 0.034165836267618606
		3 16 0.063070665069906481 20 0.86559684260308256 21 0.071332492327010971
		3 16 0.056945069736933834 20 0.84341584883829024 21 0.099639081424775885
		3 16 0.048600388431127461 20 0.77670960619315543 21 0.17469000537571697
		3 20 0.70330124451911002 21 0.2565369639880048 24 0.040161791492885172
		3 20 0.51348537134799799 21 0.44262676782546578 24 0.043887860826536076
		3 20 0.40178806654205529 21 0.56900209708474381 24 0.029209836373200949
		3 20 0.31820522947598984 21 0.65731422572638432 24 0.024480544797625708
		3 20 0.21873752636419605 24 0.5354984764116576 25 0.24576399722414627
		3 20 0.20352629703635461 24 0.48963444851927584 25 0.30683925444436971
		3 20 0.18571966143065483 24 0.46515626341230515 25 0.34912407515703991
		3 20 0.15309230051874748 24 0.44732998008291858 25 0.39957771939833409
		3 20 0.11007938195280163 24 0.41702716028654829 25 0.47289345776065012
		3 16 0.18691918857058337 20 0.24128041417487714 24 0.57180039725453957;
	setAttr ".wl[3000:3166].w"
		3 20 0.2484640094949665 24 0.57097696863843561 25 0.18055902186659795
		3 20 0.27383943178135367 24 0.52494365250620034 25 0.20121691571244585
		3 20 0.26644348111886867 24 0.48750352245117001 25 0.24605299642996142
		3 20 0.2131355263078345 24 0.46267573208186802 25 0.32418874161029759
		3 20 0.14741514800385747 24 0.4379413149243474 25 0.41464353707179513
		3 20 0.10290199873037757 24 0.41819505573892185 25 0.47890294553070051
		3 21 0.08150599335155953 24 0.37244316639233943 25 0.54605084025610096
		3 16 0.17953614821150529 20 0.23385588316827927 24 0.58660796862021547
		3 16 0.14341541751315939 20 0.25741133465657462 24 0.59917324783026593
		3 20 0.25416677843292551 24 0.56920549420747757 25 0.17662772735959698
		3 20 0.26161565169097739 24 0.51029949805168251 25 0.22808485025734007
		3 20 0.17620538421566287 24 0.50735062355036786 25 0.31644399223396941
		3 20 0.13515002382032568 24 0.45169702762449121 25 0.41315294855518314
		3 20 0.075941255803603586 24 0.40818131023750898 25 0.51587743395888763
		3 21 0.055644254403465619 24 0.33403827626284099 25 0.61031746933369346
		3 16 0.13275996179759494 20 0.20522243601836485 24 0.66201760218404015
		3 20 0.19607234694264697 24 0.64292244808663801 25 0.16100520497071491
		3 20 0.18874750412667882 24 0.58642930842823837 25 0.22482318744508281
		3 20 0.091397532858427707 24 0.47127941947563035 25 0.43732304766594177
		3 21 0.050417752342126761 24 0.39324992378367402 25 0.55633232387419929
		3 21 0.040467688053335504 24 0.32048843207147315 25 0.63904387987519129
		3 20 0.19106458886709823 24 0.5890336861760459 25 0.21990172495685575
		3 20 0.15048077660989653 24 0.57795562947618784 25 0.27156359391391566
		3 20 0.14397372734982669 24 0.52778618686839018 25 0.32824008578178315
		3 20 0.13093703691351141 24 0.47860180391202878 25 0.39046115917445978
		3 20 0.10146930609871882 24 0.43304773766473964 25 0.46548295623654162
		3 21 0.084893871855084097 24 0.38519899457864931 25 0.52990713356626673
		3 16 0.20176903857926895 20 0.19094640715888322 24 0.60728455426184769
		3 21 0.062170073599091845 24 0.33006192264183215 25 0.60776800375907591
		3 16 0.20298735581675345 24 0.59269849215507009 28 0.20431415202817643
		3 20 0.08511706730860244 24 0.57183646700993263 25 0.34304646568146496
		3 21 0.040185278666562151 24 0.29639616976411454 25 0.6634185515693235
		3 16 0.17315691878718784 20 0.17514022487810069 24 0.65170285633471159
		3 16 0.12533125464643133 24 0.74943278632946786 25 0.12523595902410087
		3 20 0.13418227768300522 24 0.71850939633098199 25 0.14730832598601293
		3 20 0.10859397480144103 24 0.68133160987929808 25 0.21007441531926099
		3 20 0.048929008519687359 24 0.4522347034969782 25 0.4988362879833344
		3 21 0.036110334399847968 24 0.3666791585495327 25 0.59721050705061918
		3 21 0.028078869710104797 24 0.3122122434611605 25 0.65970888682873463
		3 24 0.56862019940611208 25 0.20418559186026589 28 0.22719420873362198
		3 24 0.55341655670876477 25 0.2510608007423682 28 0.19552264254886689
		3 24 0.5507490118852667 25 0.32491077009647074 28 0.12434021801826252
		3 20 0.084160339216266908 24 0.50805406788737195 25 0.40778559289636113
		3 20 0.073568393679368863 24 0.44981643730239285 25 0.47661516901823814
		3 21 0.058594397331414402 24 0.38432222127979093 25 0.55708338138879465
		3 16 0.19330764599662473 24 0.54663537373116899 28 0.26005698027220631
		3 21 0.043138207619821713 24 0.32334266910372134 25 0.63351912327645699
		3 16 0.17744595196820093 24 0.55646359892337716 28 0.26609044910842194
		3 20 0.034546317118121041 24 0.58815625231635227 25 0.37729743056552684
		3 21 0.02441178976214254 24 0.3142506055377875 25 0.66133760470006997
		3 16 0.15992731420792702 24 0.63472347569290932 28 0.20534921009916371
		3 24 0.70274029608082222 25 0.12548901309202326 28 0.17177069082715454
		3 24 0.74301878413752831 25 0.16445358795217063 28 0.092527627910301002
		3 24 0.69355367155793468 25 0.25605272512097677 28 0.050393603321088568
		3 20 0.031967565107528489 24 0.47955598740222877 25 0.48847644749024272
		3 20 0.02235290717985209 24 0.37535880915163738 25 0.6022882836685105
		3 21 0.017893594552522075 24 0.32134140976258002 25 0.66076499568489788
		3 24 0.5367904123806464 25 0.20282612171593958 28 0.26038346590341405
		3 24 0.53004925598455432 25 0.2666580112993957 28 0.20329273271604992
		3 24 0.51928556280151406 25 0.34156236538918494 28 0.13915207180930111
		3 24 0.49706077391603959 25 0.40082427241427243 28 0.10211495366968795
		3 24 0.46834400184102326 25 0.47683836086867626 28 0.054817637290300522
		3 20 0.043509991165779617 24 0.41458545397665864 25 0.54190455485756173
		3 16 0.17275278648709547 24 0.5438194672030966 28 0.28342774630980805
		3 24 0.54880440663616936 25 0.18076390107059612 28 0.27043169229323449
		3 24 0.53626753091935631 25 0.2233417901819022 28 0.24039067889874133
		3 24 0.52297180304332269 25 0.30774455474977258 28 0.16928364220690476
		3 24 0.49265621571039159 25 0.42065844161090243 28 0.086685342678706118
		3 24 0.43718823724963396 25 0.51839569172746502 28 0.04441607102290094
		3 24 0.39905677549240243 25 0.57033847395536275 28 0.030604750552234879
		3 21 0.030415095675972718 24 0.36314705674082109 25 0.60643784758320618
		3 16 0.15596827569470206 24 0.57506053921279776 28 0.26897118509250023
		3 24 0.59367642152461564 25 0.16353172922028075 28 0.2427918492551035
		3 24 0.58346876010814563 25 0.22348253916467983 28 0.19304870072717462
		3 24 0.55658983533284168 25 0.31669841558976614 28 0.1267117490773923
		3 24 0.53897670149792853 25 0.39898874935173484 28 0.062034549150336696
		3 24 0.46428282568296531 25 0.49134780885835205 28 0.044369365458682565
		3 24 0.39655325282810405 25 0.57870341439219009 28 0.024743332779705956
		3 21 0.017412995556858012 24 0.34618275207202315 25 0.63640425237111886
		3 16 0.14760771909270365 24 0.61336377768262229 28 0.23902850322467392
		3 24 0.65723060918898979 25 0.14334866922567749 28 0.19942072158533275
		3 24 0.66969428831087496 25 0.19278198444022188 28 0.13752372724890316
		3 24 0.62524633522960682 25 0.28232934554328365 28 0.092424319227109586
		3 24 0.47681991611035868 25 0.49696058371043922 28 0.026219500179202215
		3 20 0.016679366828690912 24 0.40244562656486854 25 0.58087500660644065
		3 21 0.014041460272410178 24 0.34683095733775826 25 0.63912758238983147
		3 17 0.36750237843983213 18 0.57799998231764871 19 0.054497639242519103
		3 17 0.36255647880558989 18 0.56955665268435696 19 0.067886868510053239
		3 17 0.33570864410780549 18 0.55622648953095377 19 0.1080648663612407
		3 17 0.27555567479091952 18 0.53984542225719212 19 0.18459890295188855
		3 17 0.18647410813280949 18 0.54691528785637888 19 0.26661060401081171
		3 17 0.40417469737633727 18 0.56764550641189215 19 0.028179796211770494
		3 17 0.38614244538119064 18 0.57676482798001816 19 0.037092726638791332
		3 17 0.36765075287973598 18 0.59334710842771921 19 0.039002138692544888
		3 17 0.36209743562437524 18 0.58665577899481791 19 0.051246785380806903
		3 17 0.33348944710492084 18 0.58477110467214732 19 0.081739448222931832
		3 17 0.26843967938300761 18 0.55876298879685915 19 0.17279733182013302
		3 17 0.19225261719823469 18 0.55634137524945104 19 0.25140600755231435
		3 17 0.12183111839174254 18 0.57469391785498636 19 0.30347496375327099
		3 17 0.42417299923848867 18 0.55816233625387224 19 0.01766466450763916
		3 17 0.4108844328654544 18 0.5673132814326407 19 0.021802285701904824
		3 17 0.37508952695522085 18 0.59907094065614686 19 0.025839532388632378
		3 17 0.34689159223562488 18 0.61223376111304206 19 0.040874646651333148
		3 17 0.29362835833776652 18 0.62575843942126708 19 0.080613202240966367
		3 17 0.25872531922229763 18 0.5941844848323331 19 0.14709019594536932
		3 17 0.16469212003770267 18 0.5840443962648233 19 0.25126348369747387
		3 17 0.089368479648443036 18 0.59395901664809403 19 0.31667250370346295
		3 17 0.43457662010597076 18 0.55341689390453241 19 0.012006485989496888
		3 17 0.39323619498245582 18 0.59060964430633112 19 0.016154160711213082
		3 17 0.33597976819090442 18 0.6312210410980017 19 0.032799190711093933
		3 17 0.20542123793225786 18 0.61976918939641046 19 0.17480957267133174
		3 17 0.12789409209543298 18 0.6100477894113977 19 0.26205811849316929
		3 17 0.080657894378054415 18 0.60704501528033727 19 0.3122970903416083
		3 17 0.37239233015918777 18 0.57926476164102059 19 0.04834290819979168
		3 17 0.34336122495214788 18 0.59695140965433802 19 0.059687365393514123
		3 17 0.33167820417378846 18 0.5735885446058081 19 0.094733251220403422
		3 17 0.29227259761657309 18 0.54861678731896524 19 0.15911061506446156
		3 17 0.1976006660036127 18 0.5396925620151739 19 0.26270677198121339
		3 17 0.12512042284047753 18 0.55107144707452849 19 0.32380813008499409
		3 17 0.38512206546141459 18 0.57886368948284728 19 0.036014245055738095
		3 17 0.087436840205478553 18 0.58170544533505142 19 0.33085771445946988
		3 17 0.4006451229966394 18 0.57948083545077678 19 0.019874041552583654
		3 17 0.24651833838728057 18 0.6679023604024229 19 0.085579301210296443
		3 17 0.0589765366872258 18 0.60711328831296685 19 0.33391017499980741
		3 17 0.43367826187567132 18 0.55548099978817012 19 0.010840738336158692
		3 17 0.42799016448248023 18 0.56342680679879786 19 0.0085830287187219252
		3 17 0.40221018471054232 18 0.58632713869951425 19 0.011462676589943424
		3 17 0.33212379372188494 18 0.64314295304213331 19 0.024733253235981627
		3 17 0.14706995209975096 18 0.65692354692351773 19 0.19600650097673131
		3 17 0.077798056029260945 18 0.6405613833182372 19 0.28164056065250181
		3 17 0.042745022680284912 18 0.63410507443133679 19 0.32314990288837836
		3 17 0.35085768570862669 18 0.60456312171167326 19 0.044579192579700166
		3 17 0.31566894397832307 18 0.62767454326816674 19 0.056656512753510226
		3 17 0.29118638321805485 18 0.61217164612106079 19 0.096641970660884272
		3 17 0.22465015460699028 18 0.57436186218514917 19 0.20098798320786063
		3 17 0.13910255433329174 18 0.55476153170143849 19 0.30613591396526985
		3 17 0.10942146524061376 18 0.55323065917920922 19 0.33734787558017693
		3 17 0.35935125557019781 18 0.61084388962432468 19 0.029804854805477444
		3 17 0.066904587182307532 18 0.5881659384415665 19 0.34492947437612603
		3 17 0.3741327412721781 18 0.60945420469995348 19 0.016413054027868551
		3 17 0.17677738892980485 18 0.70104614934685483 19 0.1221764617233403
		3 17 0.036482455948215149 18 0.63249143694537935 19 0.33102610710640545
		3 17 0.4161487334256207 18 0.57401203808296075 19 0.0098392284914184235
		3 17 0.41066909866231277 18 0.57902335157017082 19 0.010307549767516373
		3 17 0.35998928293193577 18 0.62296104270100705 19 0.017049674367057104
		3 17 0.26816482730374852 18 0.6864842643768736 19 0.045350908319377901
		3 17 0.086311285221165213 18 0.68832008360966923 19 0.2253686311691655
		3 17 0.039228263788675624 18 0.66727864238520107 19 0.29349309382612326
		3 17 0.025141629189882431 18 0.65404758676187114 19 0.32081078404824631
		3 17 0.32339441344748499 18 0.62968700440471193 19 0.046918582147803138
		3 17 0.2927457913281758 18 0.62873213947320128 19 0.078522069198622882
		3 17 0.24277397153934788 18 0.61616147105428232 19 0.14106455740636975
		3 17 0.17396135016983252 18 0.60680800699340165 19 0.21923064283676572
		3 17 0.12262792136692324 18 0.58824768250624615 19 0.28912439612683055
		3 17 0.079507981239501924 18 0.58395424292176201 19 0.33653777583873606
		3 17 0.33810456184343751 18 0.63361355660972596 19 0.028281881546836467
		3 17 0.32382927273215212 18 0.63071141942596842 19 0.045459307841879286
		3 17 0.31076740133928643 18 0.62176102029453373 19 0.067471578366179882
		3 17 0.27735740191512576 18 0.62133000847330178 19 0.1013125896115723
		3 17 0.19970370814635371 18 0.63832394704065143 19 0.16197234481299494
		3 17 0.11898431138729162 18 0.63560926096395565 19 0.24540642764875265
		3 17 0.075393587975001744 18 0.62196305194239587 19 0.30264336008260234
		3 17 0.049482039882973831 18 0.62973450400404696 19 0.32078345611297915
		3 17 0.3634698498246588 18 0.61791110817919392 19 0.018619041996147213
		3 17 0.33891657906710643 18 0.62914233782632489 19 0.031941083106568707
		3 17 0.30785027038550533 18 0.63109109527469243 19 0.061058634339802263
		2 17 0.26068799050715219 18 0.64258881732123962;
	setAttr ".wl[3166:3177].w"
		1 19 0.096723192171608241
		3 17 0.19016449019222448 18 0.67996731397164434 19 0.12986819583613118
		3 17 0.12999915353508831 18 0.6755086530633293 19 0.1944921934015823
		3 17 0.069706964146161621 18 0.66948707958883569 19 0.2608059562650028
		3 17 0.034582614764441431 18 0.66458970798286654 19 0.30082767725269188
		3 17 0.39774730030330341 18 0.58995357619674504 19 0.012299123499951535
		3 17 0.37287840713253956 18 0.60836534311007484 19 0.018756249757385615
		3 17 0.31602248505765079 18 0.64875651874232665 19 0.035220996200022628
		3 17 0.25604751246082696 18 0.67454035224016895 19 0.069412135299004002
		3 17 0.10573811207231464 18 0.69903123940173884 19 0.19523064852594643
		3 17 0.047021633683331537 18 0.68630748749490533 19 0.26667087882176321
		3 17 0.024980219414792261 18 0.66702545173906447 19 0.30799432884614325;
	setAttr -s 61 ".pm";
	setAttr ".pm[0]" -type "matrix" 1 -0 -0 -0 -0 0.99999999999994094 3.4367910926518332e-07 0
		 0 -3.4367910926518332e-07 0.99999999999994094 -0 -0 -77.818520195186068 2.479895661057161 1;
	setAttr ".pm[1]" -type "matrix" 1.0643622975262716e-06 -3.6816075011572963e-08 -0.99999999999943301 -0
		 0.034569465596822897 0.99940229739997599 3.6588239084264121e-13 -0 0.99940229739940933 -0.034569465596803288 1.0649988374461882e-06 -0
		 -0.21171310268970261 -77.857736305498136 11.085553550357348 1;
	setAttr ".pm[2]" -type "matrix" 1.0552938430729785e-06 2.5276345160729054e-06 -0.999999999996249 -0
		 -0.13469309112924827 0.99088736554487722 2.3624603169307972e-06 0 0.99088736554713175 0.13469309112624994 1.3861322422471469e-06 -0
		 7.7706396191300726 -46.609315965363379 11.085447234530989 1;
	setAttr ".pm[3]" -type "matrix" -0.99999999999455735 -1.7849728233802442e-06 -2.7748109066376643e-06 -0
		 2.218976560732492e-06 0.25854215053435625 -0.96599997742864707 -0 2.4416892862102049e-06 -0.96599997742954669 -0.25854215052898832 -0
		 11.149421639058071 -10.299343185192027 10.742730366771191 1;
	setAttr ".pm[4]" -type "matrix" -0.99999999999412326 -2.0998929836802586e-06 -2.7100475688976763e-06 -0
		 2.4342384922021184e-06 0.12174445558238509 -0.99256147795943772 -0 2.4142061493019972e-06 -0.99256147796020167 -0.12174445557655805 -0
		 11.14940227401846 6.5133409564978475 5.2593899999976417 1;
	setAttr ".pm[5]" -type "matrix" 9.3131701251457544e-07 3.2214063256138882e-08 0.9999999999995659 -0
		 -0.034569465596827484 0.99940229739997599 3.2259583363710363e-13 0 -0.99940229739954201 -0.034569465596812475 9.3187398486082814e-07 -0
		 0.21171162004051963 -77.857736356782908 11.08555322022284 1;
	setAttr ".pm[6]" -type "matrix" 9.2338206555659972e-07 -1.2551766680022131e-07 0.9999999999995659 -0
		 0.13469347699504461 0.99088731309618927 3.2259583363048613e-13 0 -0.99088731309575906 0.1346934769949861 9.3187398486082814e-07 -0
		 -7.7706567478737387 -46.609286736543488 11.0855483440944 1;
	setAttr ".pm[7]" -type "matrix" -0.99999999999956579 9.001900711236386e-07 2.4092936624862133e-07 -0
		 -3.2259583365695586e-13 0.2585425267070437 -0.96599987675151255 0 -9.3187398486082804e-07 -0.96599987675109311 -0.25854252670693134 -0
		 -11.149516786474903 -10.299375306434822 10.742692792434715 1;
	setAttr ".pm[8]" -type "matrix" -0.9999999999995659 9.2494219033760465e-07 1.1345073029301379e-07 -0
		 -3.2259583365695586e-13 0.12174436880739199 -0.99256148860596527 0 -9.3187398486082804e-07 -0.99256148860553417 -0.12174436880733903 -0
		 -11.149514838584885 6.5133124291667679 5.2593473525608037 1;
	setAttr ".pm[9]" -type "matrix" -1 -1.2246467991467966e-16 -1.1679142126486115e-22 -0
		 1.2246467991472807e-16 -0.99999999999981393 -6.0999521827307612e-07 0 -4.2088552109542031e-23 -6.0999521827307612e-07 0.99999999999981393 0
		 3.182753060932869e-05 83.62577212384349 6.5174990337600587 1;
	setAttr ".pm[10]" -type "matrix" -1 -1.2246467991467966e-16 -1.1679142126486115e-22 -0
		 1.2246467991472807e-16 -0.99999999999981393 -6.0999521827307612e-07 0 -4.2088552109542031e-23 -6.0999521827307612e-07 0.99999999999981393 0
		 3.0601887591140852e-05 88.522240301449884 6.5175034474087008 1;
	setAttr ".pm[11]" -type "matrix" -1 -1.2246467991467966e-16 -1.1679142126486115e-22 -0
		 1.2246467991472807e-16 -0.99999999999981393 -6.0999521827307612e-07 0 -4.2088552109542031e-23 -6.0999521827307612e-07 0.99999999999981393 0
		 2.9482781759137158e-05 93.418717062125097 6.5175085418073051 1;
	setAttr ".pm[12]" -type "matrix" -1 -1.2246467991467966e-16 -1.1679142126486115e-22 -0
		 1.2246467991472807e-16 -0.99999999999981393 -6.0999521827307612e-07 0 -4.2088552109542031e-23 -6.0999521827307612e-07 0.99999999999981393 0
		 -4.5084440322594635e-06 103.66185205262819 6.5175163603367201 1;
	setAttr ".pm[13]" -type "matrix" 3.4450928483969363e-16 -0.99999999999999978 1.5973877960015552e-22 -0
		 0.99999999999998135 3.4450928483978573e-16 1.9268329587395456e-07 0 -1.9268329587395466e-07 7.3945839192651248e-23 0.99999999999998157 -0
		 -115.59229702696099 8.0951562640478745 4.5594579596822653 1;
	setAttr ".pm[14]" -type "matrix" 7.1022901307661414e-22 -0.99999999999999978 -3.445092848389986e-16 -0
		 1.7905799497557811e-06 3.4450928483978578e-16 -0.99999999999839673 0 0.99999999999839695 7.3945839192651307e-23 1.7905799497557815e-06 -0
		 4.5592732551318242 14.104779854499935 115.59230431235603 1;
	setAttr ".pm[15]" -type "matrix" -0.21717050700210636 -0.9761336849470057 -4.7683984067621417e-07 0
		 1.4999261239545803e-06 1.5479449813163105e-07 -0.99999999999886302 0 0.97613368494596997 -0.21717050700257473 1.4305116148836818e-06 -0
		 12.66429446078792 35.929337731328175 115.59229534028624 1;
	setAttr ".pm[16]" -type "matrix" -0.21717050700210636 -0.97613368494666741 -9.4229665846580355e-07 0
		 1.4999261239545803e-06 6.3163166190020511e-07 -0.99999999999867539 0 0.97613368494596997 -0.21717050700323215 1.3269566462701066e-06 -0
		 12.664345837190467 62.154168699779504 115.59231460205027 1;
	setAttr ".pm[17]" -type "matrix" -0.1810158687886278 -0.67546119297935325 0.71483245031658083 -0
		 -0.98255929945734777 0.15565289024879223 -0.10173200483172988 0 -0.042549715587580327 -0.72078037885066359 -0.69185631974226391 0
		 122.78370603923625 32.319414675994224 -30.735593453367667 1;
	setAttr ".pm[18]" -type "matrix" -0.10369858707701002 -0.85429223872664828 0.50934406238773688 -0
		 -0.9946008067539025 0.091117463100886892 -0.049667324495532537 0 -0.0039797289754189896 -0.51174444674023523 -0.85912850202272573 0
		 118.51032518320176 53.291908869402747 -21.017161368521705 1;
	setAttr ".pm[19]" -type "matrix" -0.10369858707701002 -0.85867891672737362 0.50191345967819545 -0
		 -0.9946008067539025 0.09154492423437878 -0.048874963441498928 0 -0.0039797289754189826 -0.50427179656889964 -0.86353582261679018 0
		 118.51031035190687 56.297710073633596 -20.5344903005155 1;
	setAttr ".pm[20]" -type "matrix" -0.38337574172836542 -0.92359246459264333 -1.3826998606986707e-06 0
		 1.5868208397053498e-06 8.3841225862091654e-07 -0.99999999999838929 0 0.92359246459231548 -0.38337574172994221 1.1441488486874849e-06 -0
		 20.856565891513302 70.524106948813483 115.02018893133416 1;
	setAttr ".pm[21]" -type "matrix" -0.18951558148487377 -0.95233476106361781 -0.23904465533525709 0
		 -0.053810121514065841 0.25316435005645943 -0.96592560929045257 0 0.98040211913127362 -0.17019493156493298 -0.099223838227092187 -0
		 11.200090279728817 44.520930280748388 130.01151884307569 1;
	setAttr ".pm[22]" -type "matrix" -0.18951635975710421 -0.85801580879540273 -0.47738079270283401 0
		 -0.053810112982605358 0.49453704102606427 -0.86748924304223141 0 0.98040196915612898 -0.13871548907874437 -0.13989278739245156 -0
		 9.5424696088915084 12.644083478683612 138.9160538487439 1;
	setAttr ".pm[23]" -type "matrix" -0.18951693627047228 -0.70522460346053106 -0.68318488679170164 0
		 -0.05380958694053721 0.70220850155928316 -0.70993503131705993 0 0.98040188658526306 -0.097782815524011871 -0.17102824845110984 -0
		 8.8577349007387856 -22.516993843530962 138.46557424859455 1;
	setAttr ".pm[24]" -type "matrix" -0.21717059233923008 -0.97613366596055196 -1.2006434770490958e-06 0
		 5.4625189332242568e-07 1.1084687144195361e-06 -0.99999999999923639 0 0.97613366596113749 -0.21717059233972016 2.924880558667166e-07 -0
		 9.8769667400739767 73.51420546005518 115.00538931279557 1;
	setAttr ".pm[25]" -type "matrix" -0.21717118343089301 -0.94287266107991563 -0.25264168712883434 -0
		 9.5016540581360754e-07 0.25881857235077743 -0.96592595296192485 -0 0.97613353445434003 -0.20977152236274552 -0.056207039766327904 -0
		 9.2912859102914531 44.349933465735148 130.78954012766491 1;
	setAttr ".pm[26]" -type "matrix" -0.21717169999397706 -0.84535705527238547 -0.48806546878766871 -0
		 3.8969992575965662e-07 0.49999865359562573 -0.8660261811298835 -0 0.97613341952909993 -0.18807656819434565 -0.10858522816048002 -0
		 8.7317250397458448 12.657709193663839 139.88875283706088 1;
	setAttr ".pm[27]" -type "matrix" -0.21717154866297311 -0.69023178889432901 -0.69022937930159145 -0
		 1.5364295190417594e-06 0.70710530522223358 -0.7071082571461117 -0 0.97613345319631617 -0.1535648557655902 -0.15356209371042134 -0
		 8.359523499781961 -22.490280980012788 139.60809014081309 1;
	setAttr ".pm[28]" -type "matrix" -0.041258120010411771 -0.99764775459101052 -0.054742353737494032 0
		 0.16802699327053808 0.047080735141768859 -0.98465747034741624 0 0.98491862459071666 -0.049823309183805516 0.16568928992637369 -0
		 -20.793954629725402 69.03880220681512 116.53739603917532 1;
	setAttr ".pm[29]" -type "matrix" -0.17299940624571558 -0.93450302402361018 -0.31108729245881667 0
		 0.20818886802577036 0.27401703158577961 -0.93892068974491438 0 0.96266744032857909 -0.2271976331118909 0.14714834297258128 -0
		 -15.186628092174747 42.151176881972667 131.20434602063301 1;
	setAttr ".pm[30]" -type "matrix" -0.17299950018979174 -0.82214474145584149 -0.5423552314033574 0
		 0.2081884201848033 0.50769161010962072 -0.83600646571976722 0 0.96266752029713665 -0.25754077952978249 0.083330620087420121 -0
		 -15.386526194802718 10.067429392962625 139.29774649032925 1;
	setAttr ".pm[31]" -type "matrix" -0.17299935646577949 -0.65375936759677233 -0.73666132784468463 0
		 0.2081885550780827 0.70676647255400904 -0.67612031385550242 0 0.96266751695324482 -0.27033283661632951 0.013835073185300603 -0
		 -15.473360199836034 -24.595314670296986 138.59347398806372 1;
	setAttr ".pm[32]" -type "matrix" 0.13223082972480754 -0.98861828399812846 -0.071755809624619485 -0
		 0.15142217244419787 0.091688864845417786 -0.98420753794900284 0 0.97958477599571159 0.11927715878555455 0.16182282295608694 -0
		 -29.615336179420524 63.137533824857385 118.14116811651402 1;
	setAttr ".pm[33]" -type "matrix" -0.19599782531448973 -0.92511631654904847 -0.32518402993798989 0
		 0.25970458306864025 0.27080352998047347 -0.92694065488749511 0 0.94558890750956581 -0.26613013546916386 0.18718004431570684 -0
		 -17.22975015108506 40.892841926761157 131.05267770897134 1;
	setAttr ".pm[34]" -type "matrix" -0.19599823938710698 -0.80943160815122706 -0.55353876276451752 0
		 0.25969955165678238 0.50148493142356232 -0.82526905093088954 0 0.94559020353767442 -0.30550504951771834 0.11191886209551974 -0
		 -16.594956295121062 9.0858713372919198 138.91965191395963 1;
	setAttr ".pm[35]" -type "matrix" -0.19599758009021281 -0.63858536386140485 -0.74417315300995501 0
		 0.25969981746217824 0.6979919500748204 -0.66735540938907556 0 0.94559026719234573 -0.32406167729731106 0.029035769291712005 -0
		 -16.3685987462494 -25.844548480721045 137.79900706042892 1;
	setAttr ".pm[36]" -type "matrix" -1 -1.2246467991467966e-16 -1.1679142126486115e-22 -0
		 1.2246467991472807e-16 -0.99999999999981393 -6.0999521827307612e-07 0 -4.2088552109542031e-23 -6.0999521827307612e-07 0.99999999999981393 0
		 -8.7830041017210418e-06 124.38556688111936 4.472739339958725 1;
	setAttr ".pm[37]" -type "matrix" -1 -1.2246467991467966e-16 -1.1679142126486115e-22 -0
		 1.2246467991472807e-16 -0.99999999999981393 -6.0999521827307612e-07 0 -4.2088552109542031e-23 -6.0999521827307612e-07 0.99999999999981393 0
		 -1.9854424078081692e-05 130.91363781277929 4.472736070838228 1;
	setAttr ".pm[38]" -type "matrix" 9.3210713190414856e-07 0.9999999999991902 -8.6625081298170668e-07 -0
		 -0.99999999999847577 9.3210585299965684e-07 -1.4762476186221962e-06 0 -1.476246811183548e-06 8.6625218900132007e-07 0.99999999999853506 -0
		 115.59229612773602 8.0950653010432934 4.5596584672069369 1;
	setAttr ".pm[39]" -type "matrix" 8.6625180592179319e-07 0.9999999999996011 2.1685000312747451e-07 -0
		 4.1098318262729338e-07 2.1684964700948754e-07 -0.99999999999989175 0 -0.99999999999954015 8.6625189504340394e-07 -4.1098299478100361e-07 -0
		 -4.5595237552984225 14.104754403462895 115.5922859908344 1;
	setAttr ".pm[40]" -type "matrix" -0.2171632314609544 0.97613530358316036 2.1684923522353069e-07 -0
		 -5.1122865125313403e-07 1.0841649596151845e-07 -0.99999999999986333 0 -0.97613530358305056 -0.21716323146103556 4.7548425808443839e-07 -0
		 -12.664210119234179 35.929417656023126 115.59224213521478 1;
	setAttr ".pm[41]" -type "matrix" -0.2171632314609544 0.97613530358316036 2.1684923522353069e-07 -0
		 -5.1122865125313403e-07 1.0841649596151845e-07 -0.99999999999986333 0 -0.97613530358305056 -0.21716323146103556 4.7548425808443839e-07 -0
		 -12.664257905482796 62.154298021132547 115.59219459655819 1;
	setAttr ".pm[42]" -type "matrix" -0.23255371341714764 0.65949384557932789 -0.71483329386569894 -0
		 0.96763415142189801 0.23094328393668362 -0.10173174827242086 -0 0.097994486466934011 -0.71535520355102589 -0.69185548590334378 -0
		 -125.62004177732354 22.756600845490539 -30.73592535932822 1;
	setAttr ".pm[43]" -type "matrix" -0.15634798699884506 0.84344050144345051 -0.51396831369864615 -0
		 0.98589870367565013 0.16469891655510036 -0.029631283742836405 -0 0.059657799591347947 -0.51135348577123907 -0.85729724106491878 -0
		 -122.11904759688575 44.357379081181833 -23.594655069882542 1;
	setAttr ".pm[44]" -type "matrix" -0.15634798699884503 0.84786770564095471 -0.5066316814931261 -0
		 0.98589870367565013 0.16494978539926683 -0.02820131889483541 -0 0.05965779959134794 -0.50389673746500763 -0.86170123878293181 -0
		 -122.11903276560118 47.385875580581683 -23.189398766049251 1;
	setAttr ".pm[45]" -type "matrix" -0.38336864257221337 0.92359541136360479 6.5725384004034301e-07 -0
		 -5.2228827585371158e-07 4.948323551292574e-07 -0.9999999999997411 0 -0.92359541136369094 -0.3833686425724574 2.9267984670050945e-07 -0
		 -21.412002596236025 70.524311052231084 115.02014190617393 1;
	setAttr ".pm[46]" -type "matrix" -0.18950802248440726 0.95233624973033304 0.23904471728865653 -0
		 0.053811089570047023 0.2531638050032215 -0.96592569821678032 0 -0.98040352715263801 -0.17018741224266598 -0.09922282328583025 0
		 -11.41843885796585 44.636604760979722 130.01152431237273 1;
	setAttr ".pm[47]" -type "matrix" -0.18950880075784107 0.85801723070800751 0.47738123784192243 -0
		 0.053811081038960699 0.49453653756132504 -0.86748947000771937 0 -0.98040337718346471 -0.13870848865522706 -0.13988986089863503 0
		 -9.7607893510203727 12.755803289735544 138.94599232265605 1;
	setAttr ".pm[48]" -type "matrix" -0.18950937727222322 0.70522586171851653 0.68318568478069686 -0
		 0.053810554997239878 0.70220807399325236 -0.70993538085488828 0 -0.98040329461746667 -0.097776811065109895 -0.17102360983546869 0
		 -9.0760424321553756 -22.416833652527629 138.52340435055837 1;
	setAttr ".pm[49]" -type "matrix" -0.2171633167975355 0.9761352845980249 4.752037951196952e-07 -0
		 4.424456251206193e-07 5.8525366666307051e-07 -0.99999999999973055 0 -0.97613528459804022 -0.21716331679726675 -5.58982413617011e-07 0
		 -9.8765325119459995 73.514339248223791 115.00534108393813 1;
	setAttr ".pm[50]" -type "matrix" -0.217163907890292 0.94287441232587166 0.25264140533760204 -0
		 3.8532558144233038e-08 0.25881806696444326 -0.96592608837984439 0 -0.97613515309603238 -0.20976427435083095 -0.056205979185972886 0
		 -9.2908278670941851 44.350071165205236 130.78952597311925 1;
	setAttr ".pm[51]" -type "matrix" -0.2171644244538421 0.84535881978051242 0.48806564985760942 -0
		 5.9899837641375033e-07 0.49999820047854726 -0.86602644273593365 0 -0.9761350381741617 -0.1880698416480254 -0.10858232780344101 0
		 -8.7312355330855347 12.65784306216668 139.8887712777146 1;
	setAttr ".pm[52]" -type "matrix" -0.2171642731234229 0.6902334464193608 0.69023001088247882 -0
		 -5.4773147531439438e-07 0.70710493525386953 -0.70710862711419442 0 -0.97613507184122561 -0.15355910908725764 -0.15355755122380763 -0
		 -8.3590195733560453 -22.490158033405155 139.60814012038634 1;
	setAttr ".pm[53]" -type "matrix" -0.041250805506140083 0.99764816538221146 0.054740379562092642 -0
		 -0.16802600694426542 0.04708005103084105 -0.98465767136873439 0 -0.98491909923376963 -0.049815729488192358 0.16568874753615279 -0
		 20.794387582386666 69.038876486103703 116.5372747814897 1;
	setAttr ".pm[54]" -type "matrix" -0.17299230481437977 0.93450493804019952 0.31108549187239737 -0
		 -0.20818781113457982 0.2740165625428746 -0.93892106097753425 0 -0.96266894505328326 -0.22719032600590505 0.14714978083343977 -0
		 15.438732125540296 42.151341657306524 131.20424166957554 1;
	setAttr ".pm[55]" -type "matrix" -0.1729923987574972 0.82214705628006934 0.54235398755991748 -0
		 -0.20818736329348606 0.50769125313137053 -0.83600694570009615 0 -0.96266902502211682 -0.25753409355639584 0.083333900179053441 -0
		 15.638657320981807 10.067617659281609 139.29768089325808 1;
	setAttr ".pm[56]" -type "matrix" -0.17299225503359311 0.65376192547534551 0.73666072550201878 -0
		 -0.20818749818687951 0.70676625196725607 -0.67612086987375575 0 -0.96266902167727419 -0.27032722740953252 0.013839971965093045 -0
		 15.725507830462544 -24.59511331129082 138.59345525421267 1;
	setAttr ".pm[57]" -type "matrix" 0.13223798548509658 0.9886174675211995 0.071753871720023926 -0
		 -0.15142136014226448 0.091688013498302162 -0.98420774223402741 0 -0.97958393560098245 0.1192845802805434 0.16182243979060684 -0
		 29.761909030876442 63.137552034064917 118.14104755117579 1;
	setAttr ".pm[58]" -type "matrix" -0.19599087972225523 0.92511852028597119 0.32518194674611312 -0
		 -0.25970352052219808 0.27080311932497697 -0.92694107255652369 0 -0.94559063896279794 -0.26612289264127126 0.18718159503052015 -0
		 17.367488311030041 40.943019214133045 131.0525607848638 1;
	setAttr ".pm[59]" -type "matrix" -0.19599129378145247 0.8094342759463482 0.5535373209505241 -0
		 -0.25969848910877857 0.50148464285768002 -0.82526956064822987 0 -0.9455919349891313 -0.30549845482606958 0.11192223453091847 -0
		 17.1482958749232 9.0754016211554145 138.9325184848968 1;
	setAttr ".pm[60]" -type "matrix" -0.1959906344842908 0.6385883139199996 0.74417245079299843 -0
		 -0.25969875491461192 0.69799180326525312 -0.66735597642511624 0 -0.94559199863907739 -0.3240561801591389 0.029040733641254028 -0
		 16.939484954258365 -25.80102392083058 137.82398571944984 1;
	setAttr ".gm" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 59 ".ma";
	setAttr -s 61 ".dpf[0:60]"  4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 
		4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4;
	setAttr -s 59 ".lw";
	setAttr ".mmi" yes;
	setAttr ".mi" 3;
	setAttr ".bm" 3;
	setAttr ".ucm" yes;
	setAttr -s 59 ".ifcl";
createNode tweak -n "tweak1";
	rename -uid "B2DAC83A-461F-5DCB-3ACC-F7B49958DFF2";
createNode objectSet -n "skinCluster1Set";
	rename -uid "B8643616-4069-D38A-9E52-709DCEAB503D";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "skinCluster1GroupId";
	rename -uid "48F4952A-4211-5798-D405-9A9D1DAA3D5A";
	setAttr ".ihi" 0;
createNode groupParts -n "skinCluster1GroupParts";
	rename -uid "68CFCA9B-47A0-07DF-4F35-8BA3E7220B69";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode objectSet -n "tweakSet1";
	rename -uid "98535E8A-49D3-42E5-9596-11B503431EA0";
	setAttr ".ihi" 0;
	setAttr ".vo" yes;
createNode groupId -n "groupId12";
	rename -uid "AB573029-489C-1244-F45F-C29BD6D3AF52";
	setAttr ".ihi" 0;
createNode groupParts -n "groupParts2";
	rename -uid "1252AD32-4822-3CAB-FC86-65BE043F7F08";
	setAttr ".ihi" 0;
	setAttr ".ic" -type "componentList" 1 "vtx[*]";
createNode dagPose -n "bindPose1";
	rename -uid "21D70DAF-49B4-D5F0-3EDE-E491BA735895";
	setAttr -s 62 ".wm";
	setAttr ".wm[0]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr ".wm[1]" -type "matrix" 1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1;
	setAttr -s 64 ".xm";
	setAttr ".xm[0]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[1]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[2]" -type "matrix" "xform" 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
		 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1 1 1 yes;
	setAttr ".xm[3]" -type "matrix" "xform" 1 1 1 -0 0 0 2 0 77.81851934289314 -2.4799224056567195 0
		 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -1.718395546325942e-07 0 0 0.99999999999998523 1
		 1 1 yes;
	setAttr ".xm[4]" -type "matrix" "xform" 1 1 1 -0 0 0 2 11.085550909274247 9.9475983006414026e-14
		 -3.1758851788410425e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.012223850485218957 -0.70700073902358573 0.012223863503612542 0.70700149197895179 1
		 1 1 yes;
	setAttr ".xm[5]" -type "matrix" "xform" 1 1 1 -0 0 0 2 1.5026153034003453e-05
		 -30.605605324025163 -4.8094285567401585e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-1.1878054137191974e-06 1.0101594002222694e-07 -0.084738298858684086 0.99640324201856911 1
		 1 1 yes;
	setAttr ".xm[6]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -1.0921728869612544 -34.653836435463575
		 -0.063964963294683486 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.46742066266127341 -0.53058256376077284 0.46742016473494258 0.53058312897179516 1
		 1 1 yes;
	setAttr ".xm[7]" -type "matrix" "xform" 1 1 1 -0 0 0 2 1.8607282688876126e-05
		 -16.018315386852841 4.6289644530953762 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.069676256096871128 1.0303848215019453e-07 3.4004803849140206e-08 0.99756965638310768 1
		 1 1 yes;
	setAttr ".xm[8]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -11.085550909274616 2.7000623958883807e-13
		 -3.1836587623956802e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.012223851298871435 0.70700078608331873 -0.012223862689964116 0.70700144491926564 1
		 1 1 yes;
	setAttr ".xm[9]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -1.7554062649416391e-05
		 -30.605605323998383 4.8761284414666761e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0.084738492865629123 0.99640322552010119 1 1 1 yes;
	setAttr ".xm[10]" -type "matrix" "xform" 1 1 1 -0 0 0 2 1.0921804831778825 -34.65384043156125
		 -0.063968442380502921 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.46742041369804432 0.53058284636647379 -0.46742041369804432 0.53058284636647379 1
		 1 1 yes;
	setAttr ".xm[11]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -1.9478900199487725e-06
		 -16.018321354567497 4.628968111573279 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.069676493936342399 0 0 0.99756963977094792 1
		 1 1 yes;
	setAttr ".xm[12]" -type "matrix" "xform" 1 1 1 -0 0 0 2 3.1827530619569895e-05
		 5.8072581441909108 -4.0375236209479377 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -2.9197855316218608e-23 -4.7683716376913393e-07 0.99999999999988631 6.1232339957360696e-17 1
		 1 1 yes;
	setAttr ".xm[13]" -type "matrix" "xform" 1 1 1 -0 0 0 2 1.2256430181878386e-06
		 -4.8964681776063941 -4.4136486412327258e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[14]" -type "matrix" "xform" 1 1 1 -0 0 0 2 1.1191058320036939e-06
		 -4.8964767606752133 -5.0943986042994993e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[15]" -type "matrix" "xform" 1 1 1 -0 0 0 2 3.3991225791396621e-05
		 -10.243134990503094 -7.8185294150046047e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[16]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -8.0951607724919334
		 -11.930441314516642 1.9579656172026985 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2.8378971023305993e-07 2.8378971023305988e-07 -0.70710678118649062 0.70710678118649051 1
		 1 1 yes;
	setAttr ".xm[17]" -type "matrix" "xform" 1 1 1 -0 0 0 2 0 -6.0096235904520601
		 -1.3322676295501878e-14 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 -0.70710621624454206 0 0.70710734612810167 1
		 1 1 yes;
	setAttr ".xm[18]" -type "matrix" "xform" 1 1 1 -0 0 0 2 6.2948349999203401e-05
		 -23.717423350771863 2.5365555245571159e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-2.5665985064216353e-07 -1.5291200359906259e-07 0.10923899270146691 0.99401551420160417 1
		 1 1 yes;
	setAttr ".xm[19]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -5.1376402550928901e-05
		 -26.224886087155717 1.0375666619211188e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-2.3841858188457374e-07 0 0 0.99999999999997158 1 1 1 yes;
	setAttr ".xm[20]" -type "matrix" "xform" 1 1 1 -0 0 0 2 5.4072208819614582 -3.8726170666372184
		 3.1073936686244679 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.14157369848446166 -0.65505089978216091 0.26836636695493254 0.69198605454114648 1
		 1 1 yes;
	setAttr ".xm[21]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -0.04982271546519712
		 -3.5176358293642807 0.15252437060705759 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.13469733333198086 -0.0092561472814901742 -0.042625986107427474 0.98992624848476773 1
		 1 1 yes;
	setAttr ".xm[22]" -type "matrix" "xform" 1 1 1 -0 0 0 2 1.4831294862460709e-05
		 -2.8255350434597233 0.0049684028313379258 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.0043378038073965276 0 0 0.99999059168480608 1 1 1 yes;
	setAttr ".xm[23]" -type "matrix" "xform" 1 1 1 -0 0 0 2 4.3710861732510544 -10.9202836196135
		 0.57215929924363707 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -2.3751131435764795e-07 -2.0779639087726745e-08 0.087156124120264813 0.99619466472586382 1
		 1 1 yes;
	setAttr ".xm[24]" -type "matrix" "xform" 1 1 1 -0 0 0 2 0.6448025649445448 -2.9402442543605503
		 0.10707387152810099 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.12981115608188923 -0.013643702288940374 -0.10363420777401641 0.98601362268661685 1
		 1 1 yes;
	setAttr ".xm[25]" -type "matrix" "xform" 1 1 1 -0 0 0 2 1.6576829287696278 -3.6463047905600874
		 -0.89860879299882868 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.13052566414462338 -1.4569489880219373e-07 3.6856647307166792e-07 0.99144493089603714 1
		 1 1 yes;
	setAttr ".xm[26]" -type "matrix" "xform" 1 1 1 -0 0 0 2 0.6847218354283644 -1.4436307890707383
		 -0.65925321667600656 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.13052592818230618 3.4050525703638497e-08 3.9091818700487494e-07 0.9914448961349257 1
		 1 1 yes;
	setAttr ".xm[27]" -type "matrix" "xform" 1 1 1 -0 0 0 2 2.7874952015914403 -11.360092462575309
		 0.58695092421757522 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -2.3841857098040857e-07 -4.7683715334751313e-07 4.3711278496677829e-08 0.99999999999985689 1
		 1 1 yes;
	setAttr ".xm[28]" -type "matrix" "xform" 1 1 1 -0 0 0 2 0.58568087739668151
		 -3.1751866546784555 0.15088333597884684 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.13052540010675157 1.6070921861897193e-07 3.2654238066592403e-07 0.99144496565711604 1
		 1 1 yes;
	setAttr ".xm[29]" -type "matrix" "xform" 1 1 1 -0 0 0 2 0.55966803728485104
		 -4.0822109216644051 -1.056620354418385 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.13052566414461839 -3.6015784930514203e-07 1.3721523174780091e-07 0.99144493089604202 1
		 1 1 yes;
	setAttr ".xm[30]" -type "matrix" "xform" 1 1 1 -0 0 0 2 0.37205726183347387
		 -1.7515088903389398 -0.78321876111968436 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.13052592818218381 5.02069791067774e-07 2.8754435043541352e-07 0.99144489613485054 1
		 1 1 yes;
	setAttr ".xm[31]" -type "matrix" "xform" 1 1 1 -0 0 0 2 1.0085095576160121 -11.469564155327234
		 0.59928491768179981 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.016256086927591899 0.086063167160671403 -0.08606310839786209 0.99243237163495157 1
		 1 1 yes;
	setAttr ".xm[32]" -type "matrix" "xform" 1 1 1 -0 0 0 2 0.11118757800097967
		 -3.1965053604863414 0.060054165403670368 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.13020823705180265 0.0091050458168764597 0.069159689210090344 0.98902975209692146 1
		 1 1 yes;
	setAttr ".xm[33]" -type "matrix" "xform" 1 1 1 -0 0 0 2 0.19995656228240222
		 -3.6262642785000168 -0.74124653054073519 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.1305267202954995 -2.2530050105471894e-07 -5.6437417420520652e-08 0.9914447918511885 1
		 1 1 yes;
	setAttr ".xm[34]" -type "matrix" "xform" 1 1 1 -0 0 0 2 0.086806628514121797
		 -2.0458776170653774 -0.9390146541886395 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.13052592818231123 9.7868788513938842e-08 -1.1734256434245646e-08 0.99144489613499764 1
		 1 1 yes;
	setAttr ".xm[35]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -1.2769470400995697
		 -11.385502266890555 0.62140930221775648 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.032254000423563467 0.082799573122461959 -0.17146307690342988 0.98117497084170646 1
		 1 1 yes;
	setAttr ".xm[36]" -type "matrix" "xform" 1 1 1 -0 0 0 2 0.56151288445837011
		 -2.2066097044284874 -0.025637005767919163 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.12854320456041229 0.022665643975096992 0.17216265844140702 0.97638257470262224 1
		 1 1 yes;
	setAttr ".xm[37]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -0.6341885105891798
		 -3.8382286072092811 -0.7818169538898303 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.13052513606704513 -2.412535320621712e-06 -9.8551301115755406e-07 0.99144500041499417 1
		 1 1 yes;
	setAttr ".xm[38]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -0.22644272717940694
		 -1.6150771953024847 -0.87305004865024216 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.13052566414462108 3.1352035086278333e-07 -1.7043824298920993e-07 0.99144493089605246 1
		 1 1 yes;
	setAttr ".xm[39]" -type "matrix" "xform" 1 1 1 -0 0 0 2 4.2745600694615817e-06
		 -20.723714828491183 2.0447770203779951 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 1
		 1 1 yes;
	setAttr ".xm[40]" -type "matrix" "xform" 1 1 1 -0 0 0 2 1.1071419976360651e-05
		 -6.5280709316599257 3.2691204969736987e-06 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[41]" -type "matrix" "xform" 1 1 1 -0 0 0 2 8.0951645871884708 -11.930440479367334
		 1.9579510127804181 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -2.7574656254944135e-13 6.1253238528738464e-07 0.70710711073584231 0.70710645163683383 1
		 1 1 yes;
	setAttr ".xm[42]" -type "matrix" "xform" 1 1 1 -0 0 0 2 4.9055821307320002e-06
		 -6.0096064243160754 1.1575549013542741e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		2.5288139146343739e-07 0.70710640455854878 -2.5288112207802801e-07 0.70710715781425526 1
		 1 1 yes;
	setAttr ".xm[43]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -1.9903410774624319e-05
		 -23.717423350764452 4.7897425076826039e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		4.8416943791657064e-08 -4.4058126055782716e-07 -0.10923571882690493 0.99401587398399871 1
		 1 1 yes;
	setAttr ".xm[44]" -type "matrix" "xform" 1 1 1 -0 0 0 2 4.778624861678793e-05
		 -26.224880365109435 4.7538656602341689e-05 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		0 0 0 1 1 1 1 yes;
	setAttr ".xm[45]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -5.4392936303533057
		 -4.0489084358150222 2.4202447506994389 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0.11620066831811948 0.66002406966332805 -0.2948649788592842 0.6811169329783211 1
		 1 1 yes;
	setAttr ".xm[46]" -type "matrix" "xform" 1 1 1 -0 0 0 2 0.049822729695179646
		 -3.5176344599174314 0.15252437018153486 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.13469733325856484 0.0092561499280143233 0.042625998295079404 0.98992624794521389 1
		 1 1 yes;
	setAttr ".xm[47]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -1.483128455959104e-05
		 -2.8255329910435165 0.004968402831273977 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.0043378038073965276 0 0 0.99999059168480608 1
		 1 1 yes;
	setAttr ".xm[48]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -3.8240183337967046
		 -11.016804231228562 0.57208631900888918 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -2.3751131540576668e-07 2.077961129437928e-08 -0.087156008050338893 0.99619467488070446 1
		 1 1 yes;
	setAttr ".xm[49]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -0.96261274218649362
		 -3.0054828804931759 0.12455651066835571 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.12981115619543732 0.013643701208602772 0.10363419956803763 0.98601362354910005 1
		 1 1 yes;
	setAttr ".xm[50]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -1.6577118538028657
		 -3.6462921762163205 -0.89860661931388108 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.13052566414462338 1.456948789204726e-07 -3.6856650661934361e-07 0.99144493089603714 1
		 1 1 yes;
	setAttr ".xm[51]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -0.68473412666692823
		 -1.443625976378426 -0.65925098927971248 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.13052592818230618 -3.4050525703638497e-08 -3.9091818700487494e-07 0.9914448961349257 1
		 1 1 yes;
	setAttr ".xm[52]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -2.7878414979780288
		 -11.360096929333665 0.58687914806313302 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -2.3841858685408751e-07 4.7683715334751149e-07 -4.371128246508953e-08 0.99999999999985689 1
		 1 1 yes;
	setAttr ".xm[53]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -0.58570469256488344
		 -3.1751822103179848 0.15088441821508525 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.13052540010675157 -1.607091668427706e-07 -3.2654228105886569e-07 0.99144496565711604 1
		 1 1 yes;
	setAttr ".xm[54]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -0.55969950079392916
		 -4.0822073018696443 -1.0566176733609609 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.13052566414461839 3.6015788078089545e-07 -1.3721522760395647e-07 0.99144493089604202 1
		 1 1 yes;
	setAttr ".xm[55]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -0.37207168161928195
		 -1.751506714575811 -0.78321677671132761 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.13052592818218381 -5.0206986023505775e-07 -2.8754440593674754e-07 0.99144489613485054 1
		 1 1 yes;
	setAttr ".xm[56]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -1.0088566821861029
		 -11.469581875158298 0.59921495768217881 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.016256086211342145 -0.086063108533151397 0.086063158901273654 0.99243237235120185 1
		 1 1 yes;
	setAttr ".xm[57]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -0.36042879146511808
		 -3.1626707786423935 0.050994894076325181 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.13020823697602704 -0.0091050469005187068 -0.06915969744117037 0.9890297515213482 1
		 1 1 yes;
	setAttr ".xm[58]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -0.1999836550310512
		 -3.6262643899620386 -0.74123867625567641 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.1305267202954995 2.2530048661180639e-07 5.643742518475319e-08 0.9914447918511885 1
		 1 1 yes;
	setAttr ".xm[59]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -0.08682313296374744
		 -2.0458790122799311 -0.93901008846489731 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.13052592818231123 -9.7868795605904477e-08 1.1734261299985974e-08 0.99144489613499764 1
		 1 1 yes;
	setAttr ".xm[60]" -type "matrix" "xform" 1 1 1 -0 0 0 2 1.1410634809456131 -11.435485955778816
		 0.59921386227797768 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.032253991910482331 -0.082799532830774819 0.17146306191416091 0.98117497714111346 1
		 1 1 yes;
	setAttr ".xm[61]" -type "matrix" "xform" 1 1 1 -0 0 0 2 -0.56152887638739557
		 -2.2066056847086983 -0.025632720300933443 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 
		-0.12854320606946856 -0.022665635416815409 -0.1721625934348045 0.97638258616504237 1
		 1 1 yes;
	setAttr ".xm[62]" -type "matrix" "xform" 1 1 1 -0 0 0 2 0.2185870054454071 -3.7812691648060337
		 -0.79706898922461278 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.13052513606704513 2.412535320621712e-06 9.8551301115755406e-07 0.99144500041499417 1
		 1 1 yes;
	setAttr ".xm[63]" -type "matrix" "xform" 1 1 1 -0 0 0 2 0.2088961267608731 -1.6740535865492152
		 -0.8730464057163374 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 -0.13052566414462108 -3.1352035293470543e-07 1.7043822725133324e-07 0.99144493089605246 1
		 1 1 yes;
	setAttr -s 62 ".m";
	setAttr -s 62 ".p";
	setAttr -s 64 ".g[0:63]" yes yes yes no no no no no no no no no no 
		no no no no no no no no no no no no no no no no no no no no no no no no no no no 
		no no no no no no no no no no no no no no no no no no no no no no no no;
	setAttr ".bp" yes;
createNode geomBind -n "geomBind1";
	rename -uid "8623C472-4681-2C98-D136-0DBBA3895818";
	setAttr ".mi" 3;
select -ne :time1;
	setAttr ".o" 0;
select -ne :hardwareRenderingGlobals;
	setAttr ".otfna" -type "stringArray" 22 "NURBS Curves" "NURBS Surfaces" "Polygons" "Subdiv Surface" "Particles" "Particle Instance" "Fluids" "Strokes" "Image Planes" "UI" "Lights" "Cameras" "Locators" "Joints" "IK Handles" "Deformers" "Motion Trails" "Components" "Hair Systems" "Follicles" "Misc. UI" "Ornaments"  ;
	setAttr ".otfva" -type "Int32Array" 22 0 1 1 1 1 1
		 1 1 1 0 0 0 0 0 0 0 0 0
		 0 0 0 0 ;
	setAttr ".fprt" yes;
select -ne :renderPartition;
	setAttr -s 13 ".st";
select -ne :renderGlobalsList1;
select -ne :defaultShaderList1;
	setAttr -s 15 ".s";
select -ne :postProcessList1;
	setAttr -s 2 ".p";
select -ne :defaultRenderingList1;
	setAttr -s 2 ".r";
select -ne :initialShadingGroup;
	setAttr ".ro" yes;
select -ne :initialParticleSE;
	setAttr ".ro" yes;
select -ne :defaultRenderGlobals;
	setAttr ".ren" -type "string" "arnold";
select -ne :defaultResolution;
	setAttr ".pa" 1;
select -ne :hardwareRenderGlobals;
	setAttr ".ctrs" 256;
	setAttr ".btrs" 512;
connectAttr "zoeRN.phl[1]" "groupParts2.ig";
connectAttr "zoeRN.phl[2]" "Body_geoShapeDeformed.iog.og[3].gco";
connectAttr "zoeRN.phl[3]" "zoeRN.phl[4]";
connectAttr "Body_geoShapeDeformed.iog.og[3]" "zoeRN.phl[5]";
connectAttr "zoeRN.phl[6]" "Body_geoShapeDeformed.iog.og[2].gco";
connectAttr "zoeRN.phl[7]" "zoeRN.phl[8]";
connectAttr "Body_geoShapeDeformed.iog.og[2]" "zoeRN.phl[9]";
connectAttr "zoeRN.phl[10]" "Body_geoShapeDeformed.iog.og[2].gid";
connectAttr "zoeRN.phl[11]" "Body_geoShapeDeformed.iog.og[3].gid";
connectAttr "Root.s" "Hips.is";
connectAttr "Hips.s" "LeftThigh.is";
connectAttr "LeftThigh.s" "LeftShin.is";
connectAttr "LeftShin.s" "LeftFoot.is";
connectAttr "LeftFoot.s" "LeftToe.is";
connectAttr "LeftToe.s" "LeftToeTip.is";
connectAttr "Hips.s" "RightThigh.is";
connectAttr "RightThigh.s" "RightShin.is";
connectAttr "RightShin.s" "RightFoot.is";
connectAttr "RightFoot.s" "RightToe.is";
connectAttr "RightToe.s" "RightToeTip.is";
connectAttr "Hips.s" "Spine1.is";
connectAttr "Spine1.s" "Spine2.is";
connectAttr "Spine2.s" "Spine3.is";
connectAttr "Spine3.s" "Spine4.is";
connectAttr "Spine4.s" "LeftShoulder.is";
connectAttr "LeftShoulder.s" "LeftArm.is";
connectAttr "LeftArm.s" "LeftForeArm.is";
connectAttr "LeftForeArm.s" "LeftHand.is";
connectAttr "LeftHand.s" "LeftFinger1Metacarpal.is";
connectAttr "LeftFinger1Metacarpal.s" "LeftFinger1Proximal.is";
connectAttr "LeftFinger1Proximal.s" "LeftFinger1Distal.is";
connectAttr "LeftFinger1Distal.s" "LeftFinger1Tip.is";
connectAttr "LeftHand.s" "LeftFinger2Metacarpal.is";
connectAttr "LeftFinger2Metacarpal.s" "LeftFinger2Proximal.is";
connectAttr "LeftFinger2Proximal.s" "LeftFinger2Medial.is";
connectAttr "LeftFinger2Medial.s" "LeftFinger2Distal.is";
connectAttr "LeftFinger2Distal.s" "LeftFinger2Tip.is";
connectAttr "LeftHand.s" "LeftFinger3Metacarpal.is";
connectAttr "LeftFinger3Metacarpal.s" "LeftFinger3Proximal.is";
connectAttr "LeftFinger3Proximal.s" "LeftFinger3Medial.is";
connectAttr "LeftFinger3Medial.s" "LeftFinger3Distal.is";
connectAttr "LeftFinger3Distal.s" "LeftFinger3Tip.is";
connectAttr "LeftHand.s" "LeftFinger4Metacarpal.is";
connectAttr "LeftFinger4Metacarpal.s" "LeftFinger4Proximal.is";
connectAttr "LeftFinger4Proximal.s" "LeftFinger4Medial.is";
connectAttr "LeftFinger4Medial.s" "LeftFinger4Distal.is";
connectAttr "LeftFinger4Distal.s" "LeftFinger4Tip.is";
connectAttr "LeftHand.s" "LeftFinger5Metacarpal.is";
connectAttr "LeftFinger5Metacarpal.s" "LeftFinger5Proximal.is";
connectAttr "LeftFinger5Proximal.s" "LeftFinger5Medial.is";
connectAttr "LeftFinger5Medial.s" "LeftFinger5Distal.is";
connectAttr "LeftFinger5Distal.s" "LeftFinger5Tip.is";
connectAttr "Spine4.s" "Neck.is";
connectAttr "Neck.s" "Head.is";
connectAttr "Head.s" "HeadVertex.is";
connectAttr "Spine4.s" "RightShoulder.is";
connectAttr "RightShoulder.s" "RightArm.is";
connectAttr "RightArm.s" "RightForeArm.is";
connectAttr "RightForeArm.s" "RightHand.is";
connectAttr "RightHand.s" "RightFinger1Metacarpal.is";
connectAttr "RightFinger1Metacarpal.s" "RightFinger1Proximal.is";
connectAttr "RightFinger1Proximal.s" "RightFinger1Distal.is";
connectAttr "RightFinger1Distal.s" "RightFinger1Tip.is";
connectAttr "RightHand.s" "RightFinger2Metacarpal.is";
connectAttr "RightFinger2Metacarpal.s" "RightFinger2Proximal.is";
connectAttr "RightFinger2Proximal.s" "RightFinger2Medial.is";
connectAttr "RightFinger2Medial.s" "RightFinger2Distal.is";
connectAttr "RightFinger2Distal.s" "RightFinger2Tip.is";
connectAttr "RightHand.s" "RightFinger3Metacarpal.is";
connectAttr "RightFinger3Metacarpal.s" "RightFinger3Proximal.is";
connectAttr "RightFinger3Proximal.s" "RightFinger3Medial.is";
connectAttr "RightFinger3Medial.s" "RightFinger3Distal.is";
connectAttr "RightFinger3Distal.s" "RightFinger3Tip.is";
connectAttr "RightHand.s" "RightFinger4Metacarpal.is";
connectAttr "RightFinger4Metacarpal.s" "RightFinger4Proximal.is";
connectAttr "RightFinger4Proximal.s" "RightFinger4Medial.is";
connectAttr "RightFinger4Medial.s" "RightFinger4Distal.is";
connectAttr "RightFinger4Distal.s" "RightFinger4Tip.is";
connectAttr "RightHand.s" "RightFinger5Metacarpal.is";
connectAttr "RightFinger5Metacarpal.s" "RightFinger5Proximal.is";
connectAttr "RightFinger5Proximal.s" "RightFinger5Medial.is";
connectAttr "RightFinger5Medial.s" "RightFinger5Distal.is";
connectAttr "RightFinger5Distal.s" "RightFinger5Tip.is";
connectAttr "skinCluster1GroupId.id" "Body_geoShapeDeformed.iog.og[62].gid";
connectAttr "skinCluster1Set.mwc" "Body_geoShapeDeformed.iog.og[62].gco";
connectAttr "groupId12.id" "Body_geoShapeDeformed.iog.og[63].gid";
connectAttr "tweakSet1.mwc" "Body_geoShapeDeformed.iog.og[63].gco";
connectAttr "skinCluster1.og[0]" "Body_geoShapeDeformed.i";
connectAttr "tweak1.vl[0].vt[0]" "Body_geoShapeDeformed.twl";
relationship "link" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "link" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialShadingGroup.message" ":defaultLightSet.message";
relationship "shadowLink" ":lightLinker1" ":initialParticleSE.message" ":defaultLightSet.message";
connectAttr "layerManager.dli[0]" "defaultLayer.id";
connectAttr "renderLayerManager.rlmi[0]" "defaultRenderLayer.rlid";
connectAttr "zoeRNfosterParent1.msg" "zoeRN.fp";
connectAttr "sharedReferenceNode.sr" "zoeRN.sr";
connectAttr "skinCluster1GroupParts.og" "skinCluster1.ip[0].ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1.ip[0].gi";
connectAttr "bindPose1.msg" "skinCluster1.bp";
connectAttr "Hips.wm" "skinCluster1.ma[0]";
connectAttr "LeftThigh.wm" "skinCluster1.ma[1]";
connectAttr "LeftShin.wm" "skinCluster1.ma[2]";
connectAttr "LeftFoot.wm" "skinCluster1.ma[3]";
connectAttr "RightThigh.wm" "skinCluster1.ma[5]";
connectAttr "RightShin.wm" "skinCluster1.ma[6]";
connectAttr "RightFoot.wm" "skinCluster1.ma[7]";
connectAttr "Spine1.wm" "skinCluster1.ma[9]";
connectAttr "Spine2.wm" "skinCluster1.ma[10]";
connectAttr "Spine3.wm" "skinCluster1.ma[11]";
connectAttr "Spine4.wm" "skinCluster1.ma[12]";
connectAttr "LeftShoulder.wm" "skinCluster1.ma[13]";
connectAttr "LeftArm.wm" "skinCluster1.ma[14]";
connectAttr "LeftForeArm.wm" "skinCluster1.ma[15]";
connectAttr "LeftHand.wm" "skinCluster1.ma[16]";
connectAttr "LeftFinger1Metacarpal.wm" "skinCluster1.ma[17]";
connectAttr "LeftFinger1Proximal.wm" "skinCluster1.ma[18]";
connectAttr "LeftFinger1Distal.wm" "skinCluster1.ma[19]";
connectAttr "LeftFinger2Metacarpal.wm" "skinCluster1.ma[20]";
connectAttr "LeftFinger2Proximal.wm" "skinCluster1.ma[21]";
connectAttr "LeftFinger2Medial.wm" "skinCluster1.ma[22]";
connectAttr "LeftFinger2Distal.wm" "skinCluster1.ma[23]";
connectAttr "LeftFinger3Metacarpal.wm" "skinCluster1.ma[24]";
connectAttr "LeftFinger3Proximal.wm" "skinCluster1.ma[25]";
connectAttr "LeftFinger3Medial.wm" "skinCluster1.ma[26]";
connectAttr "LeftFinger3Distal.wm" "skinCluster1.ma[27]";
connectAttr "LeftFinger4Metacarpal.wm" "skinCluster1.ma[28]";
connectAttr "LeftFinger4Proximal.wm" "skinCluster1.ma[29]";
connectAttr "LeftFinger4Medial.wm" "skinCluster1.ma[30]";
connectAttr "LeftFinger4Distal.wm" "skinCluster1.ma[31]";
connectAttr "LeftFinger5Metacarpal.wm" "skinCluster1.ma[32]";
connectAttr "LeftFinger5Proximal.wm" "skinCluster1.ma[33]";
connectAttr "LeftFinger5Medial.wm" "skinCluster1.ma[34]";
connectAttr "LeftFinger5Distal.wm" "skinCluster1.ma[35]";
connectAttr "Neck.wm" "skinCluster1.ma[36]";
connectAttr "Head.wm" "skinCluster1.ma[37]";
connectAttr "RightShoulder.wm" "skinCluster1.ma[38]";
connectAttr "RightArm.wm" "skinCluster1.ma[39]";
connectAttr "RightForeArm.wm" "skinCluster1.ma[40]";
connectAttr "RightHand.wm" "skinCluster1.ma[41]";
connectAttr "RightFinger1Metacarpal.wm" "skinCluster1.ma[42]";
connectAttr "RightFinger1Proximal.wm" "skinCluster1.ma[43]";
connectAttr "RightFinger1Distal.wm" "skinCluster1.ma[44]";
connectAttr "RightFinger2Metacarpal.wm" "skinCluster1.ma[45]";
connectAttr "RightFinger2Proximal.wm" "skinCluster1.ma[46]";
connectAttr "RightFinger2Medial.wm" "skinCluster1.ma[47]";
connectAttr "RightFinger2Distal.wm" "skinCluster1.ma[48]";
connectAttr "RightFinger3Metacarpal.wm" "skinCluster1.ma[49]";
connectAttr "RightFinger3Proximal.wm" "skinCluster1.ma[50]";
connectAttr "RightFinger3Medial.wm" "skinCluster1.ma[51]";
connectAttr "RightFinger3Distal.wm" "skinCluster1.ma[52]";
connectAttr "RightFinger4Metacarpal.wm" "skinCluster1.ma[53]";
connectAttr "RightFinger4Proximal.wm" "skinCluster1.ma[54]";
connectAttr "RightFinger4Medial.wm" "skinCluster1.ma[55]";
connectAttr "RightFinger4Distal.wm" "skinCluster1.ma[56]";
connectAttr "RightFinger5Metacarpal.wm" "skinCluster1.ma[57]";
connectAttr "RightFinger5Proximal.wm" "skinCluster1.ma[58]";
connectAttr "RightFinger5Medial.wm" "skinCluster1.ma[59]";
connectAttr "RightFinger5Distal.wm" "skinCluster1.ma[60]";
connectAttr "Hips.liw" "skinCluster1.lw[0]";
connectAttr "LeftThigh.liw" "skinCluster1.lw[1]";
connectAttr "LeftShin.liw" "skinCluster1.lw[2]";
connectAttr "LeftFoot.liw" "skinCluster1.lw[3]";
connectAttr "RightThigh.liw" "skinCluster1.lw[5]";
connectAttr "RightShin.liw" "skinCluster1.lw[6]";
connectAttr "RightFoot.liw" "skinCluster1.lw[7]";
connectAttr "Spine1.liw" "skinCluster1.lw[9]";
connectAttr "Spine2.liw" "skinCluster1.lw[10]";
connectAttr "Spine3.liw" "skinCluster1.lw[11]";
connectAttr "Spine4.liw" "skinCluster1.lw[12]";
connectAttr "LeftShoulder.liw" "skinCluster1.lw[13]";
connectAttr "LeftArm.liw" "skinCluster1.lw[14]";
connectAttr "LeftForeArm.liw" "skinCluster1.lw[15]";
connectAttr "LeftHand.liw" "skinCluster1.lw[16]";
connectAttr "LeftFinger1Metacarpal.liw" "skinCluster1.lw[17]";
connectAttr "LeftFinger1Proximal.liw" "skinCluster1.lw[18]";
connectAttr "LeftFinger1Distal.liw" "skinCluster1.lw[19]";
connectAttr "LeftFinger2Metacarpal.liw" "skinCluster1.lw[20]";
connectAttr "LeftFinger2Proximal.liw" "skinCluster1.lw[21]";
connectAttr "LeftFinger2Medial.liw" "skinCluster1.lw[22]";
connectAttr "LeftFinger2Distal.liw" "skinCluster1.lw[23]";
connectAttr "LeftFinger3Metacarpal.liw" "skinCluster1.lw[24]";
connectAttr "LeftFinger3Proximal.liw" "skinCluster1.lw[25]";
connectAttr "LeftFinger3Medial.liw" "skinCluster1.lw[26]";
connectAttr "LeftFinger3Distal.liw" "skinCluster1.lw[27]";
connectAttr "LeftFinger4Metacarpal.liw" "skinCluster1.lw[28]";
connectAttr "LeftFinger4Proximal.liw" "skinCluster1.lw[29]";
connectAttr "LeftFinger4Medial.liw" "skinCluster1.lw[30]";
connectAttr "LeftFinger4Distal.liw" "skinCluster1.lw[31]";
connectAttr "LeftFinger5Metacarpal.liw" "skinCluster1.lw[32]";
connectAttr "LeftFinger5Proximal.liw" "skinCluster1.lw[33]";
connectAttr "LeftFinger5Medial.liw" "skinCluster1.lw[34]";
connectAttr "LeftFinger5Distal.liw" "skinCluster1.lw[35]";
connectAttr "Neck.liw" "skinCluster1.lw[36]";
connectAttr "Head.liw" "skinCluster1.lw[37]";
connectAttr "RightShoulder.liw" "skinCluster1.lw[38]";
connectAttr "RightArm.liw" "skinCluster1.lw[39]";
connectAttr "RightForeArm.liw" "skinCluster1.lw[40]";
connectAttr "RightHand.liw" "skinCluster1.lw[41]";
connectAttr "RightFinger1Metacarpal.liw" "skinCluster1.lw[42]";
connectAttr "RightFinger1Proximal.liw" "skinCluster1.lw[43]";
connectAttr "RightFinger1Distal.liw" "skinCluster1.lw[44]";
connectAttr "RightFinger2Metacarpal.liw" "skinCluster1.lw[45]";
connectAttr "RightFinger2Proximal.liw" "skinCluster1.lw[46]";
connectAttr "RightFinger2Medial.liw" "skinCluster1.lw[47]";
connectAttr "RightFinger2Distal.liw" "skinCluster1.lw[48]";
connectAttr "RightFinger3Metacarpal.liw" "skinCluster1.lw[49]";
connectAttr "RightFinger3Proximal.liw" "skinCluster1.lw[50]";
connectAttr "RightFinger3Medial.liw" "skinCluster1.lw[51]";
connectAttr "RightFinger3Distal.liw" "skinCluster1.lw[52]";
connectAttr "RightFinger4Metacarpal.liw" "skinCluster1.lw[53]";
connectAttr "RightFinger4Proximal.liw" "skinCluster1.lw[54]";
connectAttr "RightFinger4Medial.liw" "skinCluster1.lw[55]";
connectAttr "RightFinger4Distal.liw" "skinCluster1.lw[56]";
connectAttr "RightFinger5Metacarpal.liw" "skinCluster1.lw[57]";
connectAttr "RightFinger5Proximal.liw" "skinCluster1.lw[58]";
connectAttr "RightFinger5Medial.liw" "skinCluster1.lw[59]";
connectAttr "RightFinger5Distal.liw" "skinCluster1.lw[60]";
connectAttr "Hips.obcc" "skinCluster1.ifcl[0]";
connectAttr "LeftThigh.obcc" "skinCluster1.ifcl[1]";
connectAttr "LeftShin.obcc" "skinCluster1.ifcl[2]";
connectAttr "LeftFoot.obcc" "skinCluster1.ifcl[3]";
connectAttr "RightThigh.obcc" "skinCluster1.ifcl[5]";
connectAttr "RightShin.obcc" "skinCluster1.ifcl[6]";
connectAttr "RightFoot.obcc" "skinCluster1.ifcl[7]";
connectAttr "Spine1.obcc" "skinCluster1.ifcl[9]";
connectAttr "Spine2.obcc" "skinCluster1.ifcl[10]";
connectAttr "Spine3.obcc" "skinCluster1.ifcl[11]";
connectAttr "Spine4.obcc" "skinCluster1.ifcl[12]";
connectAttr "LeftShoulder.obcc" "skinCluster1.ifcl[13]";
connectAttr "LeftArm.obcc" "skinCluster1.ifcl[14]";
connectAttr "LeftForeArm.obcc" "skinCluster1.ifcl[15]";
connectAttr "LeftHand.obcc" "skinCluster1.ifcl[16]";
connectAttr "LeftFinger1Metacarpal.obcc" "skinCluster1.ifcl[17]";
connectAttr "LeftFinger1Proximal.obcc" "skinCluster1.ifcl[18]";
connectAttr "LeftFinger1Distal.obcc" "skinCluster1.ifcl[19]";
connectAttr "LeftFinger2Metacarpal.obcc" "skinCluster1.ifcl[20]";
connectAttr "LeftFinger2Proximal.obcc" "skinCluster1.ifcl[21]";
connectAttr "LeftFinger2Medial.obcc" "skinCluster1.ifcl[22]";
connectAttr "LeftFinger2Distal.obcc" "skinCluster1.ifcl[23]";
connectAttr "LeftFinger3Metacarpal.obcc" "skinCluster1.ifcl[24]";
connectAttr "LeftFinger3Proximal.obcc" "skinCluster1.ifcl[25]";
connectAttr "LeftFinger3Medial.obcc" "skinCluster1.ifcl[26]";
connectAttr "LeftFinger3Distal.obcc" "skinCluster1.ifcl[27]";
connectAttr "LeftFinger4Metacarpal.obcc" "skinCluster1.ifcl[28]";
connectAttr "LeftFinger4Proximal.obcc" "skinCluster1.ifcl[29]";
connectAttr "LeftFinger4Medial.obcc" "skinCluster1.ifcl[30]";
connectAttr "LeftFinger4Distal.obcc" "skinCluster1.ifcl[31]";
connectAttr "LeftFinger5Metacarpal.obcc" "skinCluster1.ifcl[32]";
connectAttr "LeftFinger5Proximal.obcc" "skinCluster1.ifcl[33]";
connectAttr "LeftFinger5Medial.obcc" "skinCluster1.ifcl[34]";
connectAttr "LeftFinger5Distal.obcc" "skinCluster1.ifcl[35]";
connectAttr "Neck.obcc" "skinCluster1.ifcl[36]";
connectAttr "Head.obcc" "skinCluster1.ifcl[37]";
connectAttr "RightShoulder.obcc" "skinCluster1.ifcl[38]";
connectAttr "RightArm.obcc" "skinCluster1.ifcl[39]";
connectAttr "RightForeArm.obcc" "skinCluster1.ifcl[40]";
connectAttr "RightHand.obcc" "skinCluster1.ifcl[41]";
connectAttr "RightFinger1Metacarpal.obcc" "skinCluster1.ifcl[42]";
connectAttr "RightFinger1Proximal.obcc" "skinCluster1.ifcl[43]";
connectAttr "RightFinger1Distal.obcc" "skinCluster1.ifcl[44]";
connectAttr "RightFinger2Metacarpal.obcc" "skinCluster1.ifcl[45]";
connectAttr "RightFinger2Proximal.obcc" "skinCluster1.ifcl[46]";
connectAttr "RightFinger2Medial.obcc" "skinCluster1.ifcl[47]";
connectAttr "RightFinger2Distal.obcc" "skinCluster1.ifcl[48]";
connectAttr "RightFinger3Metacarpal.obcc" "skinCluster1.ifcl[49]";
connectAttr "RightFinger3Proximal.obcc" "skinCluster1.ifcl[50]";
connectAttr "RightFinger3Medial.obcc" "skinCluster1.ifcl[51]";
connectAttr "RightFinger3Distal.obcc" "skinCluster1.ifcl[52]";
connectAttr "RightFinger4Metacarpal.obcc" "skinCluster1.ifcl[53]";
connectAttr "RightFinger4Proximal.obcc" "skinCluster1.ifcl[54]";
connectAttr "RightFinger4Medial.obcc" "skinCluster1.ifcl[55]";
connectAttr "RightFinger4Distal.obcc" "skinCluster1.ifcl[56]";
connectAttr "RightFinger5Metacarpal.obcc" "skinCluster1.ifcl[57]";
connectAttr "RightFinger5Proximal.obcc" "skinCluster1.ifcl[58]";
connectAttr "RightFinger5Medial.obcc" "skinCluster1.ifcl[59]";
connectAttr "RightFinger5Distal.obcc" "skinCluster1.ifcl[60]";
connectAttr "geomBind1.scs" "skinCluster1.gb";
connectAttr "groupParts2.og" "tweak1.ip[0].ig";
connectAttr "groupId12.id" "tweak1.ip[0].gi";
connectAttr "skinCluster1GroupId.msg" "skinCluster1Set.gn" -na;
connectAttr "Body_geoShapeDeformed.iog.og[62]" "skinCluster1Set.dsm" -na;
connectAttr "skinCluster1.msg" "skinCluster1Set.ub[0]";
connectAttr "tweak1.og[0]" "skinCluster1GroupParts.ig";
connectAttr "skinCluster1GroupId.id" "skinCluster1GroupParts.gi";
connectAttr "groupId12.msg" "tweakSet1.gn" -na;
connectAttr "Body_geoShapeDeformed.iog.og[63]" "tweakSet1.dsm" -na;
connectAttr "tweak1.msg" "tweakSet1.ub[0]";
connectAttr "groupId12.id" "groupParts2.gi";
connectAttr "zoe_grp.msg" "bindPose1.m[0]";
connectAttr "jnt_grp.msg" "bindPose1.m[1]";
connectAttr "Root.msg" "bindPose1.m[2]";
connectAttr "Hips.msg" "bindPose1.m[3]";
connectAttr "LeftThigh.msg" "bindPose1.m[4]";
connectAttr "LeftShin.msg" "bindPose1.m[5]";
connectAttr "LeftFoot.msg" "bindPose1.m[6]";
connectAttr "RightThigh.msg" "bindPose1.m[8]";
connectAttr "RightShin.msg" "bindPose1.m[9]";
connectAttr "RightFoot.msg" "bindPose1.m[10]";
connectAttr "Spine1.msg" "bindPose1.m[12]";
connectAttr "Spine2.msg" "bindPose1.m[13]";
connectAttr "Spine3.msg" "bindPose1.m[14]";
connectAttr "Spine4.msg" "bindPose1.m[15]";
connectAttr "LeftShoulder.msg" "bindPose1.m[16]";
connectAttr "LeftArm.msg" "bindPose1.m[17]";
connectAttr "LeftForeArm.msg" "bindPose1.m[18]";
connectAttr "LeftHand.msg" "bindPose1.m[19]";
connectAttr "LeftFinger1Metacarpal.msg" "bindPose1.m[20]";
connectAttr "LeftFinger1Proximal.msg" "bindPose1.m[21]";
connectAttr "LeftFinger1Distal.msg" "bindPose1.m[22]";
connectAttr "LeftFinger2Metacarpal.msg" "bindPose1.m[23]";
connectAttr "LeftFinger2Proximal.msg" "bindPose1.m[24]";
connectAttr "LeftFinger2Medial.msg" "bindPose1.m[25]";
connectAttr "LeftFinger2Distal.msg" "bindPose1.m[26]";
connectAttr "LeftFinger3Metacarpal.msg" "bindPose1.m[27]";
connectAttr "LeftFinger3Proximal.msg" "bindPose1.m[28]";
connectAttr "LeftFinger3Medial.msg" "bindPose1.m[29]";
connectAttr "LeftFinger3Distal.msg" "bindPose1.m[30]";
connectAttr "LeftFinger4Metacarpal.msg" "bindPose1.m[31]";
connectAttr "LeftFinger4Proximal.msg" "bindPose1.m[32]";
connectAttr "LeftFinger4Medial.msg" "bindPose1.m[33]";
connectAttr "LeftFinger4Distal.msg" "bindPose1.m[34]";
connectAttr "LeftFinger5Metacarpal.msg" "bindPose1.m[35]";
connectAttr "LeftFinger5Proximal.msg" "bindPose1.m[36]";
connectAttr "LeftFinger5Medial.msg" "bindPose1.m[37]";
connectAttr "LeftFinger5Distal.msg" "bindPose1.m[38]";
connectAttr "Neck.msg" "bindPose1.m[39]";
connectAttr "Head.msg" "bindPose1.m[40]";
connectAttr "RightShoulder.msg" "bindPose1.m[41]";
connectAttr "RightArm.msg" "bindPose1.m[42]";
connectAttr "RightForeArm.msg" "bindPose1.m[43]";
connectAttr "RightHand.msg" "bindPose1.m[44]";
connectAttr "RightFinger1Metacarpal.msg" "bindPose1.m[45]";
connectAttr "RightFinger1Proximal.msg" "bindPose1.m[46]";
connectAttr "RightFinger1Distal.msg" "bindPose1.m[47]";
connectAttr "RightFinger2Metacarpal.msg" "bindPose1.m[48]";
connectAttr "RightFinger2Proximal.msg" "bindPose1.m[49]";
connectAttr "RightFinger2Medial.msg" "bindPose1.m[50]";
connectAttr "RightFinger2Distal.msg" "bindPose1.m[51]";
connectAttr "RightFinger3Metacarpal.msg" "bindPose1.m[52]";
connectAttr "RightFinger3Proximal.msg" "bindPose1.m[53]";
connectAttr "RightFinger3Medial.msg" "bindPose1.m[54]";
connectAttr "RightFinger3Distal.msg" "bindPose1.m[55]";
connectAttr "RightFinger4Metacarpal.msg" "bindPose1.m[56]";
connectAttr "RightFinger4Proximal.msg" "bindPose1.m[57]";
connectAttr "RightFinger4Medial.msg" "bindPose1.m[58]";
connectAttr "RightFinger4Distal.msg" "bindPose1.m[59]";
connectAttr "RightFinger5Metacarpal.msg" "bindPose1.m[60]";
connectAttr "RightFinger5Proximal.msg" "bindPose1.m[61]";
connectAttr "RightFinger5Medial.msg" "bindPose1.m[62]";
connectAttr "RightFinger5Distal.msg" "bindPose1.m[63]";
connectAttr "bindPose1.w" "bindPose1.p[0]";
connectAttr "bindPose1.m[0]" "bindPose1.p[1]";
connectAttr "bindPose1.m[1]" "bindPose1.p[2]";
connectAttr "bindPose1.m[2]" "bindPose1.p[3]";
connectAttr "bindPose1.m[3]" "bindPose1.p[4]";
connectAttr "bindPose1.m[4]" "bindPose1.p[5]";
connectAttr "bindPose1.m[5]" "bindPose1.p[6]";
connectAttr "bindPose1.m[3]" "bindPose1.p[8]";
connectAttr "bindPose1.m[8]" "bindPose1.p[9]";
connectAttr "bindPose1.m[9]" "bindPose1.p[10]";
connectAttr "bindPose1.m[3]" "bindPose1.p[12]";
connectAttr "bindPose1.m[12]" "bindPose1.p[13]";
connectAttr "bindPose1.m[13]" "bindPose1.p[14]";
connectAttr "bindPose1.m[14]" "bindPose1.p[15]";
connectAttr "bindPose1.m[15]" "bindPose1.p[16]";
connectAttr "bindPose1.m[16]" "bindPose1.p[17]";
connectAttr "bindPose1.m[17]" "bindPose1.p[18]";
connectAttr "bindPose1.m[18]" "bindPose1.p[19]";
connectAttr "bindPose1.m[19]" "bindPose1.p[20]";
connectAttr "bindPose1.m[20]" "bindPose1.p[21]";
connectAttr "bindPose1.m[21]" "bindPose1.p[22]";
connectAttr "bindPose1.m[19]" "bindPose1.p[23]";
connectAttr "bindPose1.m[23]" "bindPose1.p[24]";
connectAttr "bindPose1.m[24]" "bindPose1.p[25]";
connectAttr "bindPose1.m[25]" "bindPose1.p[26]";
connectAttr "bindPose1.m[19]" "bindPose1.p[27]";
connectAttr "bindPose1.m[27]" "bindPose1.p[28]";
connectAttr "bindPose1.m[28]" "bindPose1.p[29]";
connectAttr "bindPose1.m[29]" "bindPose1.p[30]";
connectAttr "bindPose1.m[19]" "bindPose1.p[31]";
connectAttr "bindPose1.m[31]" "bindPose1.p[32]";
connectAttr "bindPose1.m[32]" "bindPose1.p[33]";
connectAttr "bindPose1.m[33]" "bindPose1.p[34]";
connectAttr "bindPose1.m[19]" "bindPose1.p[35]";
connectAttr "bindPose1.m[35]" "bindPose1.p[36]";
connectAttr "bindPose1.m[36]" "bindPose1.p[37]";
connectAttr "bindPose1.m[37]" "bindPose1.p[38]";
connectAttr "bindPose1.m[15]" "bindPose1.p[39]";
connectAttr "bindPose1.m[39]" "bindPose1.p[40]";
connectAttr "bindPose1.m[15]" "bindPose1.p[41]";
connectAttr "bindPose1.m[41]" "bindPose1.p[42]";
connectAttr "bindPose1.m[42]" "bindPose1.p[43]";
connectAttr "bindPose1.m[43]" "bindPose1.p[44]";
connectAttr "bindPose1.m[44]" "bindPose1.p[45]";
connectAttr "bindPose1.m[45]" "bindPose1.p[46]";
connectAttr "bindPose1.m[46]" "bindPose1.p[47]";
connectAttr "bindPose1.m[44]" "bindPose1.p[48]";
connectAttr "bindPose1.m[48]" "bindPose1.p[49]";
connectAttr "bindPose1.m[49]" "bindPose1.p[50]";
connectAttr "bindPose1.m[50]" "bindPose1.p[51]";
connectAttr "bindPose1.m[44]" "bindPose1.p[52]";
connectAttr "bindPose1.m[52]" "bindPose1.p[53]";
connectAttr "bindPose1.m[53]" "bindPose1.p[54]";
connectAttr "bindPose1.m[54]" "bindPose1.p[55]";
connectAttr "bindPose1.m[44]" "bindPose1.p[56]";
connectAttr "bindPose1.m[56]" "bindPose1.p[57]";
connectAttr "bindPose1.m[57]" "bindPose1.p[58]";
connectAttr "bindPose1.m[58]" "bindPose1.p[59]";
connectAttr "bindPose1.m[44]" "bindPose1.p[60]";
connectAttr "bindPose1.m[60]" "bindPose1.p[61]";
connectAttr "bindPose1.m[61]" "bindPose1.p[62]";
connectAttr "bindPose1.m[62]" "bindPose1.p[63]";
connectAttr "Root.bps" "bindPose1.wm[2]";
connectAttr "Hips.bps" "bindPose1.wm[3]";
connectAttr "LeftThigh.bps" "bindPose1.wm[4]";
connectAttr "LeftShin.bps" "bindPose1.wm[5]";
connectAttr "LeftFoot.bps" "bindPose1.wm[6]";
connectAttr "RightThigh.bps" "bindPose1.wm[8]";
connectAttr "RightShin.bps" "bindPose1.wm[9]";
connectAttr "RightFoot.bps" "bindPose1.wm[10]";
connectAttr "Spine1.bps" "bindPose1.wm[12]";
connectAttr "Spine2.bps" "bindPose1.wm[13]";
connectAttr "Spine3.bps" "bindPose1.wm[14]";
connectAttr "Spine4.bps" "bindPose1.wm[15]";
connectAttr "LeftShoulder.bps" "bindPose1.wm[16]";
connectAttr "LeftArm.bps" "bindPose1.wm[17]";
connectAttr "LeftForeArm.bps" "bindPose1.wm[18]";
connectAttr "LeftHand.bps" "bindPose1.wm[19]";
connectAttr "LeftFinger1Metacarpal.bps" "bindPose1.wm[20]";
connectAttr "LeftFinger1Proximal.bps" "bindPose1.wm[21]";
connectAttr "LeftFinger1Distal.bps" "bindPose1.wm[22]";
connectAttr "LeftFinger2Metacarpal.bps" "bindPose1.wm[23]";
connectAttr "LeftFinger2Proximal.bps" "bindPose1.wm[24]";
connectAttr "LeftFinger2Medial.bps" "bindPose1.wm[25]";
connectAttr "LeftFinger2Distal.bps" "bindPose1.wm[26]";
connectAttr "LeftFinger3Metacarpal.bps" "bindPose1.wm[27]";
connectAttr "LeftFinger3Proximal.bps" "bindPose1.wm[28]";
connectAttr "LeftFinger3Medial.bps" "bindPose1.wm[29]";
connectAttr "LeftFinger3Distal.bps" "bindPose1.wm[30]";
connectAttr "LeftFinger4Metacarpal.bps" "bindPose1.wm[31]";
connectAttr "LeftFinger4Proximal.bps" "bindPose1.wm[32]";
connectAttr "LeftFinger4Medial.bps" "bindPose1.wm[33]";
connectAttr "LeftFinger4Distal.bps" "bindPose1.wm[34]";
connectAttr "LeftFinger5Metacarpal.bps" "bindPose1.wm[35]";
connectAttr "LeftFinger5Proximal.bps" "bindPose1.wm[36]";
connectAttr "LeftFinger5Medial.bps" "bindPose1.wm[37]";
connectAttr "LeftFinger5Distal.bps" "bindPose1.wm[38]";
connectAttr "Neck.bps" "bindPose1.wm[39]";
connectAttr "Head.bps" "bindPose1.wm[40]";
connectAttr "RightShoulder.bps" "bindPose1.wm[41]";
connectAttr "RightArm.bps" "bindPose1.wm[42]";
connectAttr "RightForeArm.bps" "bindPose1.wm[43]";
connectAttr "RightHand.bps" "bindPose1.wm[44]";
connectAttr "RightFinger1Metacarpal.bps" "bindPose1.wm[45]";
connectAttr "RightFinger1Proximal.bps" "bindPose1.wm[46]";
connectAttr "RightFinger1Distal.bps" "bindPose1.wm[47]";
connectAttr "RightFinger2Metacarpal.bps" "bindPose1.wm[48]";
connectAttr "RightFinger2Proximal.bps" "bindPose1.wm[49]";
connectAttr "RightFinger2Medial.bps" "bindPose1.wm[50]";
connectAttr "RightFinger2Distal.bps" "bindPose1.wm[51]";
connectAttr "RightFinger3Metacarpal.bps" "bindPose1.wm[52]";
connectAttr "RightFinger3Proximal.bps" "bindPose1.wm[53]";
connectAttr "RightFinger3Medial.bps" "bindPose1.wm[54]";
connectAttr "RightFinger3Distal.bps" "bindPose1.wm[55]";
connectAttr "RightFinger4Metacarpal.bps" "bindPose1.wm[56]";
connectAttr "RightFinger4Proximal.bps" "bindPose1.wm[57]";
connectAttr "RightFinger4Medial.bps" "bindPose1.wm[58]";
connectAttr "RightFinger4Distal.bps" "bindPose1.wm[59]";
connectAttr "RightFinger5Metacarpal.bps" "bindPose1.wm[60]";
connectAttr "RightFinger5Proximal.bps" "bindPose1.wm[61]";
connectAttr "RightFinger5Medial.bps" "bindPose1.wm[62]";
connectAttr "RightFinger5Distal.bps" "bindPose1.wm[63]";
connectAttr "bindPose1.msg" "geomBind1.bp";
connectAttr "defaultRenderLayer.msg" ":defaultRenderingList1.r" -na;
// End of zoeRig_v001_AD.ma
