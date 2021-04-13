---
keywords: fastai
description: "JuliaImages, OpenCV, Pillow, scikit-image"
title: "Benchmarking image processing frameworks"
toc: false
branch: master
badges: true
comments: false
categories: [julia, ml, gci19]
image: images/imageproc.png
hide: false
search_exclude: false
nb_path: _notebooks/2019-12-25-image-processing-benchmark.ipynb
layout: notebook
---

<!--
#################################################
### THIS FILE WAS AUTOGENERATED! DO NOT EDIT! ###
#################################################
# file to edit: _notebooks/2019-12-25-image-processing-benchmark.ipynb
-->

<div class="container" id="notebook-container">
        
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h1 id="Benchmarking-JuliaImages.jl">Benchmarking JuliaImages.jl<a class="anchor-link" href="#Benchmarking-JuliaImages.jl"> </a></h1><h3 id="Using:">Using:<a class="anchor-link" href="#Using:"> </a></h3><p><a href="https://github.com/JuliaCI/BenchmarkTools.jl">BenchmarkTools.jl</a> | <code>jl</code></p>
<p><a href="https://docs.python.org/3/library/timeit.html">timeit</a> | <code>py</code></p>
<h3 id="Against-:">Against :<a class="anchor-link" href="#Against-:"> </a></h3><ol>
<li><a href="https://github.com/PseudoCodeNerd/codein-julia/blob/master/benchmark-openCV-JuliaImage/bench-2.ipynb">OpenCV</a></li>
</ol>
<p>Version used : <strong>4.1.0</strong></p>
<ol>
<li><a href="https://github.com/PseudoCodeNerd/codein-julia/blob/master/benchmark-openCV-JuliaImage/bench-3.ipynb">scikit-image</a></li>
</ol>
<p>Version used : <strong>0.16.2</strong></p>
<ol>
<li>(PIL using Pillow)[<a href="https://github.com/PseudoCodeNerd/codein-julia/blob/master/benchmark-openCV-JuliaImage/bench-3.ipynb">https://github.com/PseudoCodeNerd/codein-julia/blob/master/benchmark-openCV-JuliaImage/bench-3.ipynb</a>]</li>
</ol>
<p>Version used : <strong>6.1.0</strong></p>
<h4 id="Machine-on-which-Benchmarks-were-carried-out-:">Machine on which Benchmarks were carried out :<a class="anchor-link" href="#Machine-on-which-Benchmarks-were-carried-out-:"> </a></h4><p>64Bit Windows 10 with 16 GB of RAM and i5-7200U@2.5Ghz</p>
<p>Sample image from <a href="https://testimages.juliaimages.org/">https://testimages.juliaimages.org/</a></p>
<hr>
<p><strong>Note :</strong> Compared mean times by timing only one sample in timeit.</p>

</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="c1">#Getting the Required Packages</span>
<span class="n">using</span> <span class="n">Images</span><span class="p">,</span> <span class="n">ImageTransformations</span><span class="p">,</span> <span class="n">FileIO</span><span class="p">,</span> <span class="n">BenchmarkTools</span><span class="p">,</span> <span class="n">TestImages</span>
</pre></div>

    </div>
</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="Test-1:-Loading-Image">Test 1: Loading Image<a class="anchor-link" href="#Test-1:-Loading-Image"> </a></h2>
</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="nd">@benchmark</span> <span class="n">img</span> <span class="o">=</span> <span class="n">load</span><span class="p">(</span><span class="s2">&quot;img/mountainstream.png&quot;</span><span class="p">)</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">



<div class="output_text output_subarea output_execute_result">
<pre>BenchmarkTools.Trial: 
  memory estimate:  3.39 MiB
  allocs estimate:  322
  --------------
  minimum time:     76.631 ms (0.00% GC)
  median time:      105.579 ms (0.00% GC)
  mean time:        110.319 ms (0.41% GC)
  maximum time:     209.470 ms (0.00% GC)
  --------------
  samples:          46
  evals/sample:     1</pre>
</div>

</div>

</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="Result:">Result:<a class="anchor-link" href="#Result:"> </a></h3><table>
<thead><tr>
<th>Framework</th>
<th>Time Taken (ms)</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>Images.jl</code></td>
<td>110.319</td>
</tr>
<tr>
<td><code>OpenCV</code></td>
<td>25.222</td>
</tr>
<tr>
<td><code>PIL</code></td>
<td>0.248</td>
</tr>
</tbody>
</table>
<p>$PIL &lt; OpenCV &lt; Images.jl$</p>

</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="Test-2:-Saving-Image">Test 2: Saving Image<a class="anchor-link" href="#Test-2:-Saving-Image"> </a></h2>
</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">img</span> <span class="o">=</span> <span class="n">load</span><span class="p">(</span><span class="s2">&quot;img/mountainstream.png&quot;</span><span class="p">)</span>
<span class="nd">@benchmark</span> <span class="n">save</span><span class="p">(</span><span class="s2">&quot;copy_julia.png&quot;</span><span class="p">,</span> <span class="n">img</span><span class="p">)</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">



<div class="output_text output_subarea output_execute_result">
<pre>BenchmarkTools.Trial: 
  memory estimate:  3.39 MiB
  allocs estimate:  305
  --------------
  minimum time:     257.997 ms (0.00% GC)
  median time:      336.976 ms (0.00% GC)
  mean time:        316.100 ms (0.10% GC)
  maximum time:     368.297 ms (0.00% GC)
  --------------
  samples:          16
  evals/sample:     1</pre>
</div>

</div>

</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="Result:">Result:<a class="anchor-link" href="#Result:"> </a></h3><table>
<thead><tr>
<th>Framework</th>
<th>Time Taken (ms)</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>Images.jl</code></td>
<td>316.1</td>
</tr>
<tr>
<td><code>OpenCV</code></td>
<td>40.224</td>
</tr>
<tr>
<td><code>PIL</code></td>
<td>174.674</td>
</tr>
</tbody>
</table>
<p>$OpenCV &lt;  PIL &lt; Images.jl$</p>

</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="Test-3:-Resizing-Image">Test 3: Resizing Image<a class="anchor-link" href="#Test-3:-Resizing-Image"> </a></h2>
</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">img</span> <span class="o">=</span> <span class="n">load</span><span class="p">(</span><span class="s2">&quot;img/mountainstream.png&quot;</span><span class="p">)</span>
<span class="nd">@benchmark</span> <span class="n">big_img</span> <span class="o">=</span> <span class="n">imresize</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="n">ratio</span><span class="o">=</span><span class="mi">5</span><span class="p">)</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">



<div class="output_text output_subarea output_execute_result">
<pre>BenchmarkTools.Trial: 
  memory estimate:  29.25 MiB
  allocs estimate:  6
  --------------
  minimum time:     324.998 ms (0.00% GC)
  median time:      344.478 ms (0.08% GC)
  mean time:        376.705 ms (4.31% GC)
  maximum time:     583.193 ms (0.00% GC)
  --------------
  samples:          14
  evals/sample:     1</pre>
</div>

</div>

</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="Result:">Result:<a class="anchor-link" href="#Result:"> </a></h3><table>
<thead><tr>
<th>Framework</th>
<th>Time Taken (ms)</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>Images.jl</code></td>
<td>376.705</td>
</tr>
<tr>
<td><code>OpenCV</code></td>
<td>33.105</td>
</tr>
<tr>
<td><code>PIL</code></td>
<td>57.582</td>
</tr>
</tbody>
</table>
<p>$ OpenCV &lt; PIL &lt; Images.jl$</p>

</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="Test-4:-Greyscaling-Image">Test 4: Greyscaling Image<a class="anchor-link" href="#Test-4:-Greyscaling-Image"> </a></h2>
</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">img</span> <span class="o">=</span> <span class="n">load</span><span class="p">(</span><span class="s2">&quot;img/mountainstream.png&quot;</span><span class="p">)</span>
<span class="nd">@benchmark</span> <span class="n">gray_img</span> <span class="o">=</span> <span class="n">Gray</span><span class="o">.</span><span class="p">(</span><span class="n">img</span><span class="p">)</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">



<div class="output_text output_subarea output_execute_result">
<pre>BenchmarkTools.Trial: 
  memory estimate:  384.34 KiB
  allocs estimate:  8
  --------------
  minimum time:     1.790 ms (0.00% GC)
  median time:      2.021 ms (0.00% GC)
  mean time:        2.198 ms (1.84% GC)
  maximum time:     18.771 ms (0.00% GC)
  --------------
  samples:          2264
  evals/sample:     1</pre>
</div>

</div>

</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="Result:">Result:<a class="anchor-link" href="#Result:"> </a></h3><table>
<thead><tr>
<th>Framework</th>
<th>Time Taken (ms)</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>Images.jl</code></td>
<td>2.198</td>
</tr>
<tr>
<td><code>OpenCV</code></td>
<td>0.269</td>
</tr>
<tr>
<td><code>PIL</code></td>
<td>0.985</td>
</tr>
</tbody>
</table>
<p>$ OpenCV &lt; PIL &lt; Images.jl$</p>

</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="Test-5:-Applying-Gaussian-Blur">Test 5: Applying Gaussian Blur<a class="anchor-link" href="#Test-5:-Applying-Gaussian-Blur"> </a></h2>
</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">img</span> <span class="o">=</span> <span class="n">load</span><span class="p">(</span><span class="s2">&quot;img/mountainstream.png&quot;</span><span class="p">)</span>
<span class="nd">@benchmark</span> <span class="n">gauss</span> <span class="o">=</span> <span class="n">imfilter</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="n">Kernel</span><span class="o">.</span><span class="n">gaussian</span><span class="p">(</span><span class="mi">5</span><span class="p">))</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">



<div class="output_text output_subarea output_execute_result">
<pre>BenchmarkTools.Trial: 
  memory estimate:  18.70 MiB
  allocs estimate:  603
  --------------
  minimum time:     39.857 ms (0.00% GC)
  median time:      42.566 ms (0.00% GC)
  mean time:        44.348 ms (4.84% GC)
  maximum time:     93.842 ms (0.00% GC)
  --------------
  samples:          113
  evals/sample:     1</pre>
</div>

</div>

</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="Result:">Result:<a class="anchor-link" href="#Result:"> </a></h3><table>
<thead><tr>
<th>Framework</th>
<th>Time Taken (ms)</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>Images.jl</code></td>
<td>44.348</td>
</tr>
<tr>
<td><code>OpenCV</code></td>
<td>4.007</td>
</tr>
<tr>
<td><code>PIL</code></td>
<td>33.232</td>
</tr>
</tbody>
</table>
<p>$ OpenCV &lt; PIL &lt; Images.jl$</p>

</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="Test-6:-Generating-(Greyscale)-Histogram">Test 6: Generating (Greyscale) Histogram<a class="anchor-link" href="#Test-6:-Generating-(Greyscale)-Histogram"> </a></h2>
</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">img</span> <span class="o">=</span> <span class="n">load</span><span class="p">(</span><span class="s2">&quot;img/mountainstream.png&quot;</span><span class="p">)</span>
<span class="nd">@benchmark</span> <span class="n">edges</span><span class="p">,</span> <span class="n">counts</span>  <span class="o">=</span> <span class="n">imhist</span><span class="p">(</span><span class="n">img</span><span class="p">,</span><span class="mi">256</span><span class="p">)</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">



<div class="output_text output_subarea output_execute_result">
<pre>BenchmarkTools.Trial: 
  memory estimate:  386.06 KiB
  allocs estimate:  5
  --------------
  minimum time:     19.395 ms (0.00% GC)
  median time:      20.976 ms (0.00% GC)
  mean time:        22.056 ms (0.10% GC)
  maximum time:     55.325 ms (0.00% GC)
  --------------
  samples:          227
  evals/sample:     1</pre>
</div>

</div>

</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="Result:">Result:<a class="anchor-link" href="#Result:"> </a></h3><table>
<thead><tr>
<th>Framework</th>
<th>Time Taken (ms)</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>Images.jl</code></td>
<td>22.056</td>
</tr>
<tr>
<td><code>OpenCV</code></td>
<td>1.29</td>
</tr>
<tr>
<td><code>PIL</code></td>
<td>1.773</td>
</tr>
</tbody>
</table>
<p>$ OpenCV &lt; PIL &lt; Images.jl$</p>

</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="Test-7:-Changing-colorscale-to-HSV">Test 7: Changing colorscale to HSV<a class="anchor-link" href="#Test-7:-Changing-colorscale-to-HSV"> </a></h2>
</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">img</span> <span class="o">=</span> <span class="n">load</span><span class="p">(</span><span class="s2">&quot;img/mountainstream.png&quot;</span><span class="p">)</span>
<span class="nd">@benchmark</span> <span class="n">imghsv</span> <span class="o">=</span> <span class="n">HSV</span><span class="o">.</span><span class="p">(</span><span class="n">img</span><span class="p">)</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">



<div class="output_text output_subarea output_execute_result">
<pre>BenchmarkTools.Trial: 
  memory estimate:  4.50 MiB
  allocs estimate:  8
  --------------
  minimum time:     6.093 ms (0.00% GC)
  median time:      6.461 ms (0.00% GC)
  mean time:        7.373 ms (7.22% GC)
  maximum time:     64.638 ms (0.00% GC)
  --------------
  samples:          677
  evals/sample:     1</pre>
</div>

</div>

</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="Result:">Result:<a class="anchor-link" href="#Result:"> </a></h3><table>
<thead><tr>
<th>Framework</th>
<th>Time Taken (ms)</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>Images.jl</code></td>
<td>7.373</td>
</tr>
<tr>
<td><code>OpenCV</code></td>
<td>3.675</td>
</tr>
<tr>
<td><code>PIL</code></td>
<td>22.607</td>
</tr>
</tbody>
</table>
<p>$ OpenCV &lt; Images.jl &lt; PIL$</p>

</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="Test-8:-Calculating-Integral-Image">Test 8: Calculating Integral Image<a class="anchor-link" href="#Test-8:-Calculating-Integral-Image"> </a></h2>
</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">img</span> <span class="o">=</span> <span class="n">load</span><span class="p">(</span><span class="s2">&quot;img/mountainstream.png&quot;</span><span class="p">)</span>
<span class="nd">@benchmark</span> <span class="n">integral_img</span> <span class="o">=</span> <span class="n">integral_image</span><span class="p">(</span><span class="n">img</span><span class="p">)</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">



<div class="output_text output_subarea output_execute_result">
<pre>BenchmarkTools.Trial: 
  memory estimate:  9.00 MiB
  allocs estimate:  7
  --------------
  minimum time:     4.437 ms (0.00% GC)
  median time:      5.785 ms (0.00% GC)
  mean time:        7.329 ms (16.98% GC)
  maximum time:     73.310 ms (13.81% GC)
  --------------
  samples:          681
  evals/sample:     1</pre>
</div>

</div>

</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="Result:">Result:<a class="anchor-link" href="#Result:"> </a></h3><table>
<thead><tr>
<th>Framework</th>
<th>Time Taken (ms)</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>Images.jl</code></td>
<td>7.329</td>
</tr>
<tr>
<td><code>OpenCV</code></td>
<td>0.226</td>
</tr>
<tr>
<td><code>scikit-image</code></td>
<td>37.098</td>
</tr>
</tbody>
</table>
<p>Note: PIL didn't have a method to calculate integral image. Benchmarked against scikit-image instead.</p>
<p>$ OpenCV &lt; Images.jl &lt; scikit-image$</p>

</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="Test-9:-Rotating-Image-(90-Degrees)">Test 9: Rotating Image (90 Degrees)<a class="anchor-link" href="#Test-9:-Rotating-Image-(90-Degrees)"> </a></h2>
</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">img</span> <span class="o">=</span> <span class="n">load</span><span class="p">(</span><span class="s2">&quot;img/mountainstream.png&quot;</span><span class="p">)</span>
<span class="nd">@benchmark</span> <span class="n">rotated</span> <span class="o">=</span> <span class="n">imrotate</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="n">pi</span><span class="o">/</span><span class="mi">2</span><span class="p">)</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">



<div class="output_text output_subarea output_execute_result">
<pre>BenchmarkTools.Trial: 
  memory estimate:  1.13 MiB
  allocs estimate:  5
  --------------
  minimum time:     16.047 ms (0.00% GC)
  median time:      16.682 ms (0.00% GC)
  mean time:        17.877 ms (0.82% GC)
  maximum time:     59.864 ms (0.00% GC)
  --------------
  samples:          280
  evals/sample:     1</pre>
</div>

</div>

</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="Result:">Result:<a class="anchor-link" href="#Result:"> </a></h3><table>
<thead><tr>
<th>Framework</th>
<th>Time Taken (ms)</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>Images.jl</code></td>
<td>17.877</td>
</tr>
<tr>
<td><code>OpenCV</code></td>
<td>4.317</td>
</tr>
<tr>
<td><code>PIL</code></td>
<td>2.808</td>
</tr>
</tbody>
</table>
<p>$ PIL &lt; OpenCV &lt; Images.jl$</p>

</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="Test-10:-Corner-Detection-using-Harris-Method">Test 10: Corner Detection using Harris Method<a class="anchor-link" href="#Test-10:-Corner-Detection-using-Harris-Method"> </a></h2>
</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">img</span> <span class="o">=</span> <span class="n">load</span><span class="p">(</span><span class="s2">&quot;img/mountainstream.png&quot;</span><span class="p">)</span>
<span class="nd">@benchmark</span> <span class="n">corners</span> <span class="o">=</span> <span class="n">imcorner</span><span class="p">(</span><span class="n">img</span><span class="p">;</span> <span class="n">method</span> <span class="o">=</span> <span class="n">harris</span><span class="p">)</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">



<div class="output_text output_subarea output_execute_result">
<pre>BenchmarkTools.Trial: 
  memory estimate:  70.88 MiB
  allocs estimate:  101873
  --------------
  minimum time:     75.884 ms (8.44% GC)
  median time:      83.419 ms (9.94% GC)
  mean time:        86.072 ms (10.41% GC)
  maximum time:     136.603 ms (24.07% GC)
  --------------
  samples:          59
  evals/sample:     1</pre>
</div>

</div>

</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="Result:">Result:<a class="anchor-link" href="#Result:"> </a></h3><table>
<thead><tr>
<th>Framework</th>
<th>Time Taken (ms)</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>Images.jl</code></td>
<td>86.072</td>
</tr>
<tr>
<td><code>OpenCV</code></td>
<td>22.802</td>
</tr>
<tr>
<td><code>scikit-image</code></td>
<td>112.88</td>
</tr>
</tbody>
</table>
<p>$  OpenCV &lt; Images.jl &lt; scikit-image$</p>

</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="Task-11:-Morphological-Operation---Erode">Task 11: Morphological Operation - Erode<a class="anchor-link" href="#Task-11:-Morphological-Operation---Erode"> </a></h2>
</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">img</span> <span class="o">=</span> <span class="n">load</span><span class="p">(</span><span class="s2">&quot;img/mountainstream.png&quot;</span><span class="p">)</span>
<span class="nd">@benchmark</span> <span class="n">imge</span> <span class="o">=</span> <span class="n">erode</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="p">[</span><span class="mi">5</span><span class="p">,</span><span class="mi">5</span><span class="p">])</span> <span class="c1">#over 5x5 1&#39;s Kernel</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">



<div class="output_text output_subarea output_execute_result">
<pre>BenchmarkTools.Trial: 
  memory estimate:  1.13 MiB
  allocs estimate:  3
  --------------
  minimum time:     405.601 μs (0.00% GC)
  median time:      512.500 μs (0.00% GC)
  mean time:        706.785 μs (23.49% GC)
  maximum time:     71.665 ms (99.14% GC)
  --------------
  samples:          7020
  evals/sample:     1</pre>
</div>

</div>

</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="Result:">Result:<a class="anchor-link" href="#Result:"> </a></h3><table>
<thead><tr>
<th>Framework</th>
<th>Time Taken (μs)</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>Images.jl</code></td>
<td>706.785</td>
</tr>
<tr>
<td><code>OpenCV</code></td>
<td>1190.893</td>
</tr>
<tr>
<td><code>scikit-image</code></td>
<td>40561.481</td>
</tr>
</tbody>
</table>
<p>$ Images.jl &lt;  OpenCV &lt; scikit-image$</p>

</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="Task-12:-Morphological-Operation---Opening">Task 12: Morphological Operation - Opening<a class="anchor-link" href="#Task-12:-Morphological-Operation---Opening"> </a></h2>
</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">img</span> <span class="o">=</span> <span class="n">load</span><span class="p">(</span><span class="s2">&quot;img/mountainstream.png&quot;</span><span class="p">)</span>
<span class="nd">@benchmark</span> <span class="n">imgc</span> <span class="o">=</span> <span class="n">closing</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="p">[</span><span class="mi">5</span><span class="p">,</span><span class="mi">5</span><span class="p">])</span> <span class="c1">#over 5x5 1&#39;s Kernel</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">



<div class="output_text output_subarea output_execute_result">
<pre>BenchmarkTools.Trial: 
  memory estimate:  1.13 MiB
  allocs estimate:  3
  --------------
  minimum time:     408.499 μs (0.00% GC)
  median time:      469.999 μs (0.00% GC)
  mean time:        652.171 μs (22.81% GC)
  maximum time:     33.034 ms (0.00% GC)
  --------------
  samples:          7595
  evals/sample:     1</pre>
</div>

</div>

</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="Result:">Result:<a class="anchor-link" href="#Result:"> </a></h3><table>
<thead><tr>
<th>Framework</th>
<th>Time Taken (μs)</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>Images.jl</code></td>
<td>652.171</td>
</tr>
<tr>
<td><code>OpenCV</code></td>
<td>1587.633</td>
</tr>
<tr>
<td><code>scikit-image</code></td>
<td>68730.478</td>
</tr>
</tbody>
</table>
<p>$ Images.jl &lt;  OpenCV &lt; scikit-image$</p>

</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="Test-13:-Morphological-Operation---TopHat">Test 13: Morphological Operation - TopHat<a class="anchor-link" href="#Test-13:-Morphological-Operation---TopHat"> </a></h2>
</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">img</span> <span class="o">=</span> <span class="n">load</span><span class="p">(</span><span class="s2">&quot;img/mountainstream.png&quot;</span><span class="p">)</span>
<span class="nd">@benchmark</span> <span class="n">imgth</span> <span class="o">=</span> <span class="n">tophat</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="p">[</span><span class="mi">9</span><span class="p">,</span><span class="mi">9</span><span class="p">])</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">



<div class="output_text output_subarea output_execute_result">
<pre>BenchmarkTools.Trial: 
  memory estimate:  2.25 MiB
  allocs estimate:  5
  --------------
  minimum time:     960.600 μs (0.00% GC)
  median time:      1.263 ms (0.00% GC)
  mean time:        1.687 ms (19.92% GC)
  maximum time:     28.826 ms (95.24% GC)
  --------------
  samples:          2937
  evals/sample:     1</pre>
</div>

</div>

</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="Result:">Result:<a class="anchor-link" href="#Result:"> </a></h3><table>
<thead><tr>
<th>Framework</th>
<th>Time Taken (ms)</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>Images.jl</code></td>
<td>1.687</td>
</tr>
<tr>
<td><code>OpenCV</code></td>
<td>1.82</td>
</tr>
<tr>
<td><code>scikit-image</code></td>
<td>65.544</td>
</tr>
</tbody>
</table>
<p>$ Images.jl &lt;  OpenCV &lt; scikit-image$</p>

</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="Test-14:-Morphological-Operation---BottomHat">Test 14: Morphological Operation - BottomHat<a class="anchor-link" href="#Test-14:-Morphological-Operation---BottomHat"> </a></h2>
</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">img</span> <span class="o">=</span> <span class="n">load</span><span class="p">(</span><span class="s2">&quot;img/mountainstream.png&quot;</span><span class="p">)</span>
<span class="nd">@benchmark</span> <span class="n">imgth</span> <span class="o">=</span> <span class="n">bothat</span><span class="p">(</span><span class="n">img</span><span class="p">,</span> <span class="p">[</span><span class="mi">9</span><span class="p">,</span><span class="mi">9</span><span class="p">])</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">



<div class="output_text output_subarea output_execute_result">
<pre>BenchmarkTools.Trial: 
  memory estimate:  2.25 MiB
  allocs estimate:  5
  --------------
  minimum time:     950.299 μs (0.00% GC)
  median time:      1.079 ms (0.00% GC)
  mean time:        1.482 ms (20.42% GC)
  maximum time:     23.362 ms (92.39% GC)
  --------------
  samples:          3346
  evals/sample:     1</pre>
</div>

</div>

</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="Result:">Result:<a class="anchor-link" href="#Result:"> </a></h3><table>
<thead><tr>
<th>Framework</th>
<th>Time Taken (ms)</th>
</tr>
</thead>
<tbody>
<tr>
<td><code>Images.jl</code></td>
<td>1.482</td>
</tr>
<tr>
<td><code>OpenCV</code></td>
<td>1.913</td>
</tr>
<tr>
<td><code>scikit-image</code></td>
<td>81.389</td>
</tr>
</tbody>
</table>
<p>$ Images.jl &lt;  OpenCV &lt; scikit-image$</p>

</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="Test-15:-Segmentation--Connected-Components">Test 15: Segmentation- Connected Components<a class="anchor-link" href="#Test-15:-Segmentation--Connected-Components"> </a></h2>
</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">img</span> <span class="o">=</span> <span class="n">load</span><span class="p">(</span><span class="s2">&quot;img/mountainstream.png&quot;</span><span class="p">)</span>
<span class="nd">@benchmark</span> <span class="n">markers</span> <span class="o">=</span> <span class="n">label_components</span><span class="p">(</span><span class="n">img</span><span class="p">)</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">



<div class="output_text output_subarea output_execute_result">
<pre>BenchmarkTools.Trial: 
  memory estimate:  10.85 MiB
  allocs estimate:  70
  --------------
  minimum time:     9.715 ms (0.00% GC)
  median time:      10.430 ms (0.00% GC)
  mean time:        12.003 ms (9.84% GC)
  maximum time:     36.741 ms (58.12% GC)
  --------------
  samples:          416
  evals/sample:     1</pre>
</div>

</div>

</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="End-of-report.">End of report.<a class="anchor-link" href="#End-of-report."> </a></h2>
</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>Please accept now sir.</p>

</div>
</div>
</div>
</div>
 
