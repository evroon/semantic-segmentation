FROM nvcr.io/nvidia/pytorch:19.10-py3

RUN pip install --no-cache-dir \
    runx==0.0.6 numpy sklearn h5py jupyter scikit-image \
    pillow piexif cffi tqdm dominate opencv-python nose \
    ninja

RUN apt-get update && apt-get install libgtk2.0-dev -y && rm -rf /var/lib/apt/lists/*

# Install Apex
RUN cd /home/ && git clone https://github.com/NVIDIA/apex.git apex && cd apex && python setup.py install --cuda_ext --cpp_ext
WORKDIR /hrnet/

