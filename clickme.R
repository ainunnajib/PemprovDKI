library(clickme)

clickme("points", 
        x = treemapdata$SKPD.DPRD,
        y = treemapdata$DPRD.HasilPembahasan/1000000,
        names = treemapdata$MataAnggaran,
        dir = getwd(),
        file_name = "DataUsulanDPRD.html",
        xlab = "SKPD.DPRD",
        ylab = "Besaran (juta)")
