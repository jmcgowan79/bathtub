# Makefile for Bathtub Mechanism Project
#
# Author/Point of Contact: John F. McGowan, Ph.D. (jmcgowan79@gmail.com)
#

# Smoldyn: a spatial stochastic simulator for chemical reaction networks
# http://www.smoldyn.org

SMOLDYN=smoldyn  # simulator for reaction-diffusion in cells
RM=rm -f  # remove file
CD=cd   # change directory (folder)
FFMPEG=ffmpeg  # ffmpeg video encoder tool to make mp4 (MPEG-4) video files (www.ffmpeg.org)
DATAFILES=data_bathtub_simpleC10S.txt \
data_bathtub_simpleC50S.txt \
data_bathtub_simpleC100S.txt

IMAGEFILES=data_bathtub_simpleC10S_images.txt

VIDEOFILES= bathtub_simpleC10S.mp4

all: data video

data: $(DATAFILES)

video: smol_images $(VIDEOFILES)

smol_images: $(IMAGEFILES)

clean: 
	$(RM) images/*.tif
	$(RM) images/*.mp4
	$(RM) data_bathtub_simple*.txt  # clean generated data files

# simulated data

data_bathtub_simple%.txt: bathtub_simple%.txt
	$(SMOLDYN) $<

# video

bathtub_simpleC10S.mp4: data_bathtub_simpleC10S_images.txt
	$(CD) images; pwd; $(FFMPEG) -i bathtub_simpleC10S%06d.tif $@


