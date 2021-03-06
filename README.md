# rubberband-audio

Ruby interface for [Rubber Band Library](http://breakfastquay.com/rubberband/).

## Requirements

- Ruby 1.9.x
- [Rubber Band Library](http://breakfastquay.com/rubberband/) Linux source, windows executable and Mac universal binaries are provided.

## Usage

To process a sound, use following code:

    rubberband = RubberBand::Processor.new "input.wav", "output.wav", :pitch => 9
    rubberband.run 

the output.wav should then processed with pitch raised by 9 semitones


## Reference

Rubber Band [Usage](http://breakfastquay.com/rubberband/usage.txt)

## Contributing to rubberband-audio
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2012 Francis Chong. See LICENSE.txt for
further details.

