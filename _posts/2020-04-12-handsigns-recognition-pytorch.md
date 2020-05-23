---
layout: post
title: "Hand Signs Recognition with PyTorch"
description: First Computer Vision Endeavour using PyTorch.
toc: false
comments: false
image: images/handsigns.jpeg
hide: false
search_exclude: false
categories: [pytorch, dl]
--- 

{% include info.html text="Code at https://github.com/PseudoCodeNerd/pytorch-playground/tree/master/handsigns-pytorch" %}

### Rewrote code from [CS230 PyTorch Code Examples](https://github.com/cs230-stanford/cs230-code-examples/tree/master/pytorch/vision) to acclimatize myself with PyTorch Workflow.
#### *Read the Documentation at the [source page](https://github.com/cs230-stanford/cs230-code-examples/blob/master/pytorch/vision/README.md) to recreate.*

As I venture into Deep Learning, I wanted to try PyTorch as a framework. This project is my first *vision* implementation using PyTorch. It was really helpful in getting myself used to the best practices to follow while using PyTorch for deep learning. 

I've made the tough decision of choosing PyTorch as my go-to deep learning framework because of its more pythonic and numpy-like approach which made it easier to get used to the dynamic-graph paradigm. Also, debugging was a breeze. Tensorflow was really complex to understand with concepts like session, graph, variable scope, etc. being really hard to comprehend. 

### Task
Given an image of a hand doing a sign representing 0, 1, 2, 3, 4 or 5, predict the correct label.
*Model is trained on a 64x64 image dataset. For resizing, please see [`build_dataset`](https://github.com/cs230-stanford/cs230-code-examples/blob/master/pytorch/vision/build_dataset.py)*

---

## Key Takeaways from this Vision Experiment
1. How to **organize** any Deep Learning Project in PyTorch.
2. How to **work with Datasets and Dataloaders** to get the data into the model.
3. How to **implement** stuff like dropout, regularization, batch-normalization, transforms, logging and reproducibility.
4. Utilizing `nn.Module` to better **structure the actual model.**
5. **Effectively searching for optimal hyper-parameters** through the use of various `experiments/`.
6. How to work with `argparse`.

### Final Accuracy on the Test Set : 0.9453125 | [Here.](experiments/surely_overfit/learning_rate_0.001/)
The base model given in CS230 gave ~ 83% test-set accuracy.

---

## Resources

- [PyTorch documentation](https://pytorch.org/docs/stable/index.html)
- [PyTorch : What is `torch.nn` ?](https://pytorch.org/tutorials/beginner/nn_tutorial.html)
- [PyTorch : Writing Custom Datasets, Dataloaders & Transforms](https://pytorch.org/tutorials/beginner/data_loading_tutorial.html)
- [CS230 Blog](https://cs230.stanford.edu/blog/pytorch/)
- [SIGNS Dataset](https://drive.google.com/file/d/1ufiR6hUKhXoAyiBNsySPkUwlvE_wfEHC/view?usp=sharing)
