## 1. Install Anaconda

Anaconda is the preferred method of installing DeepFaceLab on Linux. Anaconda is a data science platform for scientific computing and makes managing machine learning libraries significantly easier. Native installation of these libraries is possible, but native uninstallation of these libraries can be significantly painful and introduce significantly much more bloat, which is why I will not be supporting that method of installation.

To download the installer, follow this link and download the Anaconda platform for Linux x64.
[https://www.anaconda.com/distribution/#linux](https://www.anaconda.com/distribution/#linux). 

After installing the platform, you might need to add conda command into your path for further usage of the platform. You can do this with the following commands. 
```bash
export PATH=~/anaconda3/bin:$PATH
conda init bash #  (if you use zsh, conda init zsh, it depends on what shell you uses)
# Restart your shell; For changes to take effect, close and re-open your current shell
```

Or, you can open the Run-Control files for the shell you use (such as .bashrc or .zshrc), if you find the following sentences exist, maybe just restart your shell is enough, that is to say, the above is unnecessary.
```bash
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/xxx/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/xxx/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/xxx/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/xxx/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
```



## 2. Install System Dependencies 

You will need FFMpeg, Git, and the NVIDIA driver for your system to use this project. Git is easy to install. And, it is also easy for you to install the remaining if you are sudoer. If not, for convenience and time saving  you had better ask sudoers for help. 



## 3. Install DeepFaceLab

You will now need to create the DeepFaceLab environment with the following libraries. After creating the environment, you can activate it to work within the environment. You will not typically need to activate the environment when using this fork, as the scripts will automatically set it for you. If you want to change the name and other behavior, alter `env.sh` found in the scripts directory.

After creating and activating the environment, you will need to clone the repo and additionally install more dependencies using the Python command. Make sure your environment is active before doing this, otherwise you will be using your system Python!

You should do these with the following commands in your user directory.

```bash
conda create -n deepfacelab -c main python=3.6.8 cudnn=7.6.5 cudatoolkit=10.0.130
conda activate deepfacelab
git clone https://github.com/lbfs/DeepFaceLab_Linux.git
cd DeepFaceLab_Linux
git clone https://github.com/iperov/DeepFaceLab.git
python -m pip install -r ./DeepFaceLab/requirements-cuda.txt
```

After that the seems like that 
```
DeepFaceLab_Linux
├── DeepFaceLab
├── README.md
├── scripts
├── workspace
├── XnView
```



## 4. Download pretrain_CelebA and pretrain_Quick96

Finally, you will need to use the provided datasets required for DeepFaceLab training. 

1. Download the latest NVIDIA build from the main repository for Windows. [https://mega.nz/folder/Po0nGQrA#dbbttiNWojCt8jzD4xYaPw](https://mega.nz/folder/Po0nGQrA#dbbttiNWojCt8jzD4xYaPw)
2. Extract the build and go into the _internal folder. ``7z x DeepFaceLab_NVIDIA_build_XX_XX_XXX.exe``
3. Copy both pretrain_CelebA and pretrain_Quick96 to the directory DeepFaceLab_Linux/

After that the seems like that 
```
DeepFaceLab_Linux
├── DeepFaceLab
├── pretrain_CelebA
├── pretrain_Quick96
├── README.md
├── scripts
├── workspace
├── XnView
```

If the link becomes invalid, please go to the [https://github.com/iperov/DeepFaceLab](https://github.com/iperov/DeepFaceLab) to get the newest link.



## 5. Read the corresponding guide and paper as well as source code

1. Guide: [https://mrdeepfakes.com/forums/thread-guide-deepfacelab-2-0-explained-and-tutorials-recommended](https://mrdeepfakes.com/forums/thread-guide-deepfacelab-2-0-explained-and-tutorials-recommended)
2. Paper: [https://arxiv.org/abs/2005.05535](https://arxiv.org/abs/2005.05535)
3. Source code: [https://github.com/iperov/DeepFaceLab](https://github.com/iperov/DeepFaceLab)



## 6. Navigate to the scripts directory and begin using DeepFaceLab_Linux :)

```bash
cd ~/DeepFaceLab_Linux/scripts
./1_clear_workspace.sh # for example
./2_extract_PNG_from_video_data_src.sh # for example          
```



## 7. Without GUI, Xshell + Xmanager(serving as X server) +  X11 forwarding may help

If you use ssh connecting to server without GUI, some features such as interactive merger, training preview don't work at all. You can avoid using these features by executing the shell scripts with `_no_preview`. But this is not a very good way to do it, a better way is to take advantage of the `X11 forwarding` feature, using software such as `Xshell `and `Xmanager` (as X server) or other software with similar features, allowing you to run a remote Linux program with a graphical user interface on your local computer.

If your linux server lacks of necessary `.so` file, the program will be terminated unexpectedly and it will output detailed debug info. If you find something like that ` libxcb-xinerama.so.0: cannot open shared object file: No such file or directory) `, just run `sudo apt-get install libxcb-xinerama0` could fix it. If the program still doesn't work, go online for getting better help.




## 8.  Customize your script files
If you find that the script files are outdated or lack of some features, feel free to customize your script files. And the author of DeepFaceLab will release the official script files for Windows OS, you could refer to them for customizing your scrip files.