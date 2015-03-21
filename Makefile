# Makefile for Bathtub Mechanism Project
#
# Author/Point of Contact: John F. McGowan, Ph.D. (jmcgowan79@gmail.com)
#

SMOLDYN=smoldyn  # simulator for reaction-diffusion in cells
RM=rm -f  # remove file
CD=cd   # change directory (folder)
FFMPEG=ffmpeg
DATAFILES=data_bathtub_simpleC10S_images.txt
VIDEOFILES= bathtub_simpleC10S.mp4

all: $(DATAFILES) $(VIDEOFILES)

video: $(VIDEOFILES)

clean: 
	$(RM) images/*.tif
	$(RM) images/*.mp4

# simulated data

data_bathtub_simpleC10S.txt: bathtub_simple_C10S.txt
	$(SMOLDYN) $<

data_bathtub_simpleC10S_images.txt: bathtub_simpleC10S_images.txt
	$(SMOLDYN) $<

# video

bathtub_simpleC10S.mp4: data_bathtub_simpleC10S_images.txt
	$(CD) images; pwd; $(FFMPEG) -i bathtub_simpleC10S%06d.tif $@


