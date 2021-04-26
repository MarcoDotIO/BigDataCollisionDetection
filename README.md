# Big Data Motor Colission

## Table of contents

- [Dependencies](#dependencies)
  - [GNU Octave](#gnu_octave)
  - [Packages](#packages)
  - [Data](#data)
- [How to Use](#how_to_use)
- [References](#references)

## Dependencies

### GNU Octave
```
$ sudo apt install octave
```

### Packages
Ran within GNU Octave
```
$ pkg install -forge signal control outliers io struct statistics optim data-smoothing
$ pkg load signal control outliers io struct statistics optim data-smoothing
```

### Data
Data must be taken from a PPG sensor for 60 seconds.

## How to Use
Run within GNU Octave
```
$ cd /Directory-containing-BigDataCollisionDetection
$ getCollision
```

## References

- [FindPeaks Functionality](https://octave.sourceforge.io/signal/function/findpeaks.html)
