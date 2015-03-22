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

# NOTE:
#
# The files bathtub_simpleCNNNS.txt where NNN is a number such as 100
# contain smoldyn scripts configuring smoldyn to simulate
# a reaction in a box with NNN sources.  The parameters are tuned so that the number of
# cell killer molecules (red balls) will grow without limit when the number of sources
# is over 100 but stay minimal when the number of sources is less than 100
#

# simulated data files
DATAFILES=data_bathtub_simpleC10S.txt \
data_bathtub_simpleC50S.txt \
data_bathtub_simpleC100S.txt \
data_bathtub_simpleC110S.txt \
data_bathtub_simpleC120S.txt \
data_bathtub_simpleC130S.txt \
data_bathtub_simpleC150S.txt \
data_bathtub_simpleC200S.txt \
data_bathtub_simpleC90S.txt

# simulated image sequence data files
IMAGEFILES=data_bathtub_simpleC10S_images.txt

# video of the simulations
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


