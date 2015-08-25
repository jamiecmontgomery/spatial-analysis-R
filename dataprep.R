#Getting the data for intro to spatial workshop

library(raster)

dir_N = c('Windows' = '//neptune.nceas.ucsb.edu/data_edit',
          'Darwin'  = '/Volumes/data_edit',
          'Linux'   = '/var/data/ohi')[[ Sys.info()[['sysname']] ]]


#read in 200nm CA current shapefile
ca_cur = readOGR(dsn='data',layer='ca_current')

#set extent for cropping raster data(slightly larger than shapefile extent)
ext<-extent(-17866228,-5016377,1516514,9447281)

# read in recent 5 years of SST data and clip to ca_cur

oa_files = list.files(file.path(dir_N,
      'git-annex/globalprep/Pressures_OceanAcidification/v2015/working/annualmean_2005-2014/moll'),full.names = T)

#select just most recent 5

for (i in 1:5){
  
  oa = raster(oa_files[i])
  yr=substr(names(oa),22,25)
  #r_proj = projectRaster(oa,crs = ('+proj=longlat'))
  c = crop(oa,ext)
  
  writeRaster(c,paste0('data/oa_moll_',yr,'.tif'),overwrite=T)
  
}

# calculate average OA (don't need to do this twice in the actual script)

oaFiles = list.files('data',pattern='oa_moll',full.names=T)

oaAvg = stack(oaFiles)%>%calc(.,fun=function(x){mean(x,na.rm=T)},filename='data/oa_avg.tif',overwrite=T)





