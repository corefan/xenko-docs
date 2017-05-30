# Sound asset properties
After you select a sound asset in the **Asset view**, you can configure its properties in the **Property grid**.

![Sound asset properties](media/audio-asset-properties.png)

* **Source**: Change the source audio file. Note that Xenko never alters source files.
* **Sample rate**: Choose the rate at which Xenko [resamples](https://en.wikipedia.org/wiki/Sampling_(signal_processing)#Sampling_rate) the source file. The higher the sample rate, the higher-quality the audio. Typical sample rates are 44.1 kHz (44,100 Hz), 48 kHz, 88.2 kHz, and 96 kHz. Note that a high sampling rate won't improve the quality of a low-quality audio file.
* **Compression ratio**: Set the compression rate from 1 (no compression) to 40 (maximum). Greater compression optimizes memory use, but decreases audio quality. Xenko compresses audio files with the open-source [Opus/Celt](https://en.wikipedia.org/wiki/CELT) codec.
* **Stream from disk**: Streaming is useful for larger audio files, as it saves memory. For more information, see [Stream audio](stream-audio.md).
* **Spatialized**: Specify that this sound asset is [spatialized audio](spatialized-audio.md).

## See also
* [Import audio](import-audio.md)
* [Global audio settings](global-audio-settings.md)
* [Spatialized audio](spatialized-audio.md)
* [Non-spatialized audio](non-spatialized-audio.md)