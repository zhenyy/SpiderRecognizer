# Spider Recognition iOS App
This repository contains swift scripts and Core ML models for our real-time spider recognition app  

A video demo of our app: https://www.youtube.com/watch?v=LvMvKccfGkA&t=2s  

Link to the deep learning model development repo: https://github.com/zhenyy/poisonous-spider-recognition
## Basic mode
Offers two functions:   
- Classifying a single spider by taking a photo or supplying a photo from library
- Real-time classification from camera feed 
- Display both spider type and toxicity
## Advanced mode
- Locating and classifying multiple spiders by taking a photo or supplying a photo from library
- Real-time detection from camera feed 
- Display spider types, toxicity and bounding boxes indicate spider locations
## Spider Gallery
A gallery contains detailed introductions of different spiders
## Spider Map
A map showing the locations of the spiders shared by users  

Link to the Spider Map repo: https://github.com/zhenyy/SpiderMap  
## Things that we used
- The project is not possible without this nice series of tutorials created by [pyimagesearch](https://www.pyimagesearch.com/):  
[How to (quickly) build a deep learning image dataset](https://www.pyimagesearch.com/2018/04/09/how-to-quickly-build-a-deep-learning-image-dataset/)  
[Keras and Convolutional Neural Networks (CNNs)](https://www.pyimagesearch.com/2018/04/16/keras-and-convolutional-neural-networks-cnns/)  
[Running Keras models on iOS with CoreML](https://www.pyimagesearch.com/2018/04/23/running-keras-models-on-ios-with-coreml/)  

- And this blogpost written by [Matthijs Hollemans](https://github.com/hollance):  
[MobileNetV2 + SSDLite with Core ML](https://machinethink.net/blog/mobilenet-ssdlite-coreml/)  
with [Source code](https://github.com/hollance/coreml-survival-guide/tree/master/MobileNetV2%2BSSDLite)
