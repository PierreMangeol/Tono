//run("Enhance Contrast...", "saturated=0");
//run("8-bit");


norm_std=newArray(roiManager("Count"));
mean_array=newArray(roiManager("Count"));
std_array=newArray(roiManager("Count"));
area_array=newArray(roiManager("Count"));

for (roi = 0; roi < roiManager("Count"); roi++){
	roiManager("Select", roi);	
	getStatistics(area, mean, min, max, std, histogram);
	norm_std[roi] = std/mean;
	mean_array[roi] = mean;
	std_array[roi] = std;
  	area_array[roi] = area;

	}


name = getTitle();
image_folder_name = getDirectory("Please select the folder containing your images");

f = File.open(image_folder_name + File.separator + name +".csv");

        string="";
        for (l=0; l<lengthOf(norm_std); l++) {
            if (l==0) {
                string=string+"std_mean"+"\t"+ "mean"+"\t"+ "std"+"\t"+ "area"+"\r";
            }
            else {
                string=string+norm_std[l]+"\t"+mean_array[l]+"\t"+std_array[l]+"\t"+area_array[l]+"\r";//'\r' passage à la ligne
            }
            
        }
        print(f, string);
      
    File.close(f);