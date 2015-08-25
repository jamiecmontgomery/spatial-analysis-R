# Prep raw sea surface temperature (CoRTAD version 5) for OHI 2015

library(raster)

#paths

dir_N = c('Windows' = '//neptune.nceas.ucsb.edu/data_edit',
          'Darwin'  = '/Volumes/data_edit',
          'Linux'   = '/var/data/ohi')[[ Sys.info()[['sysname']] ]]

#set working directory
setwd(file.path(dir_N,'git-annex/globalprep/Pressures_SST'))

cols = rev(colorRampPalette(brewer.pal(11, 'Spectral'))(255)) # rainbow color scheme for plotting

# set tmp directory

tmpdir='~/big/R_raster_tmp'
dir.create(tmpdir, showWarnings=F)
rasterOptions(tmpdir=tmpdir)

#-----------------------------------------------------

# data

# Bring in raw data

weekly_sst   = stack('data/cortadv5_WeeklySST.nc',varname='WeeklySST')

names_weekly = names(weekly_sst)

#set extent for cropping raster data(slightly larger than shapefile extent)
ext<-extent(-132,-105,20,50)


for (i in 2008:2012){
  
  print(i)
  
  s = stack()
  
  for (j in 1:53){
    
    print(j)
    
    w = which(substr(names_weekly,2,5)==i)[j]
    if(is.na(w))next()
    
    w_week = weekly_sst[[w]]
    
    week_crop = crop(w_week,ext)
    
    s = stack(s,week_crop)
    
  }
  
  average = calc(s,fun=function(x){mean(x,na.rm=T)},progress='text',filename=paste0('data/average_annual_sst_',i,'.tif'),overwrite=T)
}

