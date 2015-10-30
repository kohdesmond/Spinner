Spinner
==============

Creates a beautiful animation for you to show while loading data for your views

https://youtu.be/nUhC05pGTjA

## Usage
1. Import all images and SpinnerView.swift in your existing project.
2. 
2. Initialise a new istance of GearLoading: 
	_ = GearLoading(showGearLoadingForView: self.view)

3. Hide when necessary with: 
	 if let spinner = getGearLoadingForView(self.view) as? GearLoading {
            spinner.hideGearLoadingForView(spinner)
        }
## Notes
This is a swift port and adaptation of `VMGearLoadingView ` made by VuMai (https://github.com/VuMai/VMGearsLoading).


## License
MIT
