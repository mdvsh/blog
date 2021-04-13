---
keywords: fastai
description: "Part 1 with TextAnalysis.jl | Amazon Reviews Dataset"
title: "Comparing Sentiment Analysis Models"
toc: false
branch: master
badges: true
comments: false
categories: [julia, ml, gci19]
image: images/sent.png
hide: false
search_exclude: false
nb_path: _notebooks/2020-01-14-Sentiment-Analysis-with-TextAnalysis(jl).ipynb
layout: notebook
---

<!--
#################################################
### THIS FILE WAS AUTOGENERATED! DO NOT EDIT! ###
#################################################
# file to edit: _notebooks/2020-01-14-Sentiment-Analysis-with-TextAnalysis(jl).ipynb
-->

<div class="container" id="notebook-container">
        
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>{% include note.html content='Part 2 of this notebook is accomplished with TensorFlow and can be <a href="https://gist.github.com/PseudoCodeNerd/493a3f477bd97fc15b24c853e7de7d9c">found here.</a>' %}</p>
<h2 id="Task-Description">Task Description<a class="anchor-link" href="#Task-Description"> </a></h2><p>Use the amazon review data from Kaggle to test the efficiency of our Sentiment Analysis models that live in TextAnalysis.jl. Compare it with models in ScikitLearn and Spacy python libraries. Upload your results as an issue in the TextAnalysis package.</p>
<p>Some basic machine learning knowledge is useful for this task.</p>
<h4 id="Special-thanks-to-Ayush-Kaushal;-an-exemplary-mentor-without-whom-this-task-wouldn't-be-possible.">Special thanks to Ayush Kaushal; an exemplary mentor without whom this task wouldn't be possible.<a class="anchor-link" href="#Special-thanks-to-Ayush-Kaushal;-an-exemplary-mentor-without-whom-this-task-wouldn't-be-possible."> </a></h4><p>Find below, the <code>julia</code> part of the task. The python notebook would be attached too but would have sparse documentation.</p>
<blockquote><p>The process of algorithmically identifying and categorizing opinions expressed in text to determine the user’s attitude toward the subject of the document (or post).</p>
</blockquote>
<p>This is how I understand it.</p>
<h2 id="Importing-Required-Packages">Importing Required Packages<a class="anchor-link" href="#Importing-Required-Packages"> </a></h2>
</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">using</span> <span class="n">TextAnalysis</span><span class="p">,</span> <span class="n">FileIO</span>
</pre></div>

    </div>
</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>I would be working on the test data since the train one is <strong>humongous</strong> and my laptop was unable to render that in Jupyter every single time even when left for about an hour.</p>
<p>So, declaring the test reviews as <code>review</code> as evident by the code below.</p>

</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">reviews</span> <span class="o">=</span> <span class="n">Document</span><span class="p">(</span><span class="s2">&quot;text/test.ft.txt&quot;</span><span class="p">)</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">



<div class="output_text output_subarea output_execute_result">
<pre>FileDocument(&#34;text/test.ft.txt&#34;, TextAnalysis.DocumentMetadata(Languages.English(), &#34;text/test.ft.txt&#34;, &#34;Unknown Author&#34;, &#34;Unknown Time&#34;))</pre>
</div>

</div>

</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>Getting to know some of our data.</p>
<p>We can see that the <code>.txt</code> file contains reviews in the form of :</p>
<p>"<strong><strong>label</strong>1(/2)</strong> <em>space</em> <strong>...the review...</strong>"</p>
<p>Exploratory data analysis also reveals that reviews beginning with <code>__label__2</code> are positive reviews. That means that their sentiment score would also be higher (I'll demonstrate that in a sec...)
Similarly, reviews beginning with <code>__label__1</code> are negative reviews and so their sentiment score should evidently be lower.</p>

</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="Getting-our-pre-trained-Sentiment-Analyser-to-check-on-these-lines.">Getting our pre-trained Sentiment Analyser to check on these lines.<a class="anchor-link" href="#Getting-our-pre-trained-Sentiment-Analyser-to-check-on-these-lines."> </a></h3>
</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">sent</span> <span class="o">=</span> <span class="n">SentimentAnalyzer</span><span class="p">()</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">

<div class="output_subarea output_stream output_stderr output_text">
<pre>┌ Info: CUDAdrv.jl failed to initialize, GPU functionality unavailable (set JULIA_CUDA_SILENT or JULIA_CUDA_VERBOSE to silence or expand this message)
└ @ CUDAdrv C:\Users\shekh\.julia\packages\CUDAdrv\3EzC1\src\CUDAdrv.jl:69
</pre>
</div>
</div>

<div class="output_area">



<div class="output_text output_subarea output_execute_result">
<pre>Sentiment Analysis Model Trained on IMDB with a 88587 word corpus</pre>
</div>

</div>

</div>
</div>

</div>
    {% endraw %}

    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="c1">#seeing how the data is arranged.</span>
<span class="n">readlines</span><span class="p">(</span><span class="s2">&quot;text/test.ft.txt&quot;</span><span class="p">)[</span><span class="mi">1</span><span class="p">:</span><span class="mi">3</span><span class="p">]</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">



<div class="output_text output_subarea output_execute_result">
<pre>3-element Array{String,1}:
 &#34;__label__2 Great CD: My lovely Pat has one of the GREAT voices of her generation. I have listened to this CD for YEARS and I still LOVE IT. When I&#39;m in a good mood it makes me feel better. A bad mood just evaporates like sugar in the rain. This CD just oozes LIFE. Vocals are jusat STUUNNING and lyrics just kill. One of life&#39;s hidden gems. This is a desert isle CD in my book. Why she never made it big is just beyond me. Everytime I play this, no matter black, white, young, old, male, female EVERYBODY says one thing \&#34;Who was that singing ?\&#34;&#34;                                                                                                                                                                                                                                                                                         
 &#34;__label__2 One of the best game music soundtracks - for a game I didn&#39;t really play: Despite the fact that I have only played a small portion of the game, the music I heard (plus the connection to Chrono Trigger which was great as well) led me to purchase the soundtrack, and it remains one of my favorite albums. There is an incredible mix of fun, epic, and emotional songs. Those sad and beautiful tracks I especially like, as there&#39;s not too many of those kinds of songs in my other video game soundtracks. I must admit that one of the songs (Life-A Distant Promise) has brought tears to my eyes on many occasions.My one complaint about this soundtrack is that they use guitar fretting effects in many of the songs, which I find distracting. But even if those weren&#39;t included I would still consider the collection worth it.&#34;
 &#34;__label__1 Batteries died within a year ...: I bought this charger in Jul 2003 and it worked OK for a while. The design is nice and convenient. However, after about a year, the batteries would not hold a charge. Might as well just get alkaline disposables, or look elsewhere for a charger that comes with batteries that have better staying power.&#34;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 </pre>
</div>

</div>

</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>Now, I'll see that for the first 10 reviews in our dataset, what the actual label is and what sentiment score does our model return. From this we'll be able to know that the model isn't perfect and does indeed predict wrong sentiments for some reviews. Thus, developing a need to do text pre-processing to make the reviews comparable and remove unnecessary stuff like urls and other things generally not contributing to the <em>read/feel</em> of the review. !</p>

</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">tab</span> <span class="o">=</span> <span class="s2">&quot;SNo. |  Label  | Prediction Score | Should be |  Predicted  | Correct/Incorrect  &quot;</span>
<span class="n">println</span><span class="p">(</span><span class="n">tab</span><span class="p">)</span>
<span class="n">println</span><span class="p">(</span><span class="s2">&quot;-&quot;</span><span class="o">^</span><span class="p">(</span><span class="n">length</span><span class="p">(</span><span class="n">tab</span><span class="p">)</span><span class="o">+</span><span class="mi">5</span><span class="p">))</span>
<span class="k">for</span> <span class="n">i</span> <span class="ow">in</span> <span class="mi">1</span><span class="p">:</span><span class="mi">15</span>
    <span class="n">label</span> <span class="o">=</span> <span class="n">readlines</span><span class="p">(</span><span class="s2">&quot;text/test.ft.txt&quot;</span><span class="p">)[</span><span class="n">i</span><span class="p">][</span><span class="mi">1</span><span class="p">:</span><span class="mi">10</span><span class="p">];</span>
    <span class="n">review</span> <span class="o">=</span> <span class="n">readlines</span><span class="p">(</span><span class="s2">&quot;text/test.ft.txt&quot;</span><span class="p">)[</span><span class="n">i</span><span class="p">][</span><span class="mi">11</span><span class="p">:</span><span class="n">end</span><span class="p">];</span>
    <span class="n">review</span> <span class="o">=</span> <span class="n">StringDocument</span><span class="p">(</span><span class="n">review</span><span class="p">);</span>
    <span class="n">pred</span> <span class="o">=</span> <span class="n">sent</span><span class="p">(</span><span class="n">review</span><span class="p">);</span>
    <span class="k">if</span> <span class="n">label</span> <span class="o">==</span> <span class="s2">&quot;__label__2&quot;</span>
        <span class="n">should_be</span> <span class="o">=</span> <span class="s2">&quot;+ve&quot;</span>
    <span class="k">else</span>
        <span class="n">should_be</span> <span class="o">=</span> <span class="s2">&quot;-ve&quot;</span>
    <span class="n">end</span>
    <span class="k">if</span> <span class="n">pred</span> <span class="o">&gt;=</span> <span class="mf">0.5</span>
        <span class="n">pred_be</span> <span class="o">=</span> <span class="s2">&quot;+ve&quot;</span>
    <span class="n">elseif</span> <span class="n">pred</span> <span class="o">&lt;</span> <span class="mf">0.5</span>
        <span class="n">pred_be</span> <span class="o">=</span> <span class="s2">&quot;-ve&quot;</span>
    <span class="n">end</span>
    <span class="k">if</span> <span class="n">pred_be</span> <span class="o">==</span> <span class="n">should_be</span>
        <span class="n">correct</span> <span class="o">=</span> <span class="s2">&quot;Correct&quot;</span>
    <span class="k">else</span>
        <span class="n">correct</span> <span class="o">=</span> <span class="s2">&quot;Incorrect&quot;</span>
    <span class="n">end</span>
    <span class="n">println</span><span class="p">(</span><span class="s2">&quot;$i   | $label  | $pred  |  $should_be  |  $pred_be | $correct  &quot;</span><span class="p">)</span>
<span class="n">end</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">

<div class="output_subarea output_stream output_stdout output_text">
<pre>SNo. |  Label  | Prediction Score | Should be |  Predicted  | Correct/Incorrect  
--------------------------------------------------------------------------------------
1   | __label__2  | 0.39506337  |  +ve  |  -ve | Incorrect  
2   | __label__2  | 0.5314957  |  +ve  |  +ve | Correct  
3   | __label__1  | 0.52432084  |  -ve  |  +ve | Incorrect  
4   | __label__2  | 0.5501878  |  +ve  |  +ve | Correct  
5   | __label__2  | 0.5919624  |  +ve  |  +ve | Correct  
6   | __label__1  | 0.61544746  |  -ve  |  +ve | Incorrect  
7   | __label__1  | 0.732198  |  -ve  |  +ve | Incorrect  
8   | __label__1  | 0.55473757  |  -ve  |  +ve | Incorrect  
9   | __label__2  | 0.4127747  |  +ve  |  -ve | Incorrect  
10   | __label__1  | 0.58470565  |  -ve  |  +ve | Incorrect  
11   | __label__2  | 0.5855292  |  +ve  |  +ve | Correct  
12   | __label__1  | 0.51694876  |  -ve  |  +ve | Incorrect  
13   | __label__1  | 0.5547061  |  -ve  |  +ve | Incorrect  
14   | __label__2  | 0.45876318  |  +ve  |  -ve | Incorrect  
15   | __label__1  | 0.52366424  |  -ve  |  +ve | Incorrect  
</pre>
</div>
</div>

</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>It's clear that our model isn't optimal since out of 15 samples, only <strong>4</strong> were correct predictions. However, I went a little too harsh on the model since in some cases, like in</p>
<p><code>14   | __label__2  | 0.45876318  |  +ve  |  -ve | Incorrect</code></p>
<p>the model was within some limit of correct predictions. So yeah, sorry Mr. Sentiment Analyzer.</p>
<p>Moving on towards trying to improve the accuracy of predcitions by performing some general pre-defined text-processing functions in TextAnalysis package. But first, I want to know the length of our test data set so I can make batches of processing accrodinly to my computational powers.</p>

</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">test_data</span> <span class="o">=</span> <span class="n">readlines</span><span class="p">(</span><span class="s2">&quot;text/test.ft.txt&quot;</span><span class="p">)</span>
<span class="n">length</span><span class="p">(</span><span class="n">test_data</span><span class="p">)</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">



<div class="output_text output_subarea output_execute_result">
<pre>400000</pre>
</div>

</div>

</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>Ok, so now we know the size of the data we're dealing with let's get started with the pre-processing.</p>

</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>A true positive is an outcome where the model correctly predicts the positive class. Similarly, a true negative is an outcome where the model correctly predicts the negative class.</p>
<p>A false positive is an outcome where the model incorrectly predicts the positive class. And a false negative is an outcome where the model incorrectly predicts the negative class.</p>

</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">test_labels</span> <span class="o">=</span> <span class="p">[]</span>
<span class="n">test_string</span> <span class="o">=</span> <span class="p">[]</span>
<span class="n">fal_pos</span> <span class="o">=</span> <span class="mi">0</span>
<span class="n">fal_neg</span> <span class="o">=</span> <span class="mi">0</span>
<span class="n">tru_pos</span> <span class="o">=</span> <span class="mi">0</span>
<span class="n">tru_neg</span> <span class="o">=</span> <span class="mi">0</span>
<span class="k">for</span> <span class="n">i</span> <span class="ow">in</span> <span class="mi">1</span><span class="p">:</span><span class="n">length</span><span class="p">(</span><span class="n">test_data</span><span class="p">)</span>
    <span class="n">label</span> <span class="o">=</span><span class="n">test_data</span><span class="p">[</span><span class="n">i</span><span class="p">][</span><span class="mi">1</span><span class="p">:</span><span class="mi">10</span><span class="p">];</span>
    <span class="n">push</span><span class="o">!(</span>test_labels, label<span class="o">)</span><span class="p">;</span>
    <span class="n">review</span> <span class="o">=</span> <span class="n">test_data</span><span class="p">[</span><span class="n">i</span><span class="p">][</span><span class="mi">11</span><span class="p">:</span><span class="n">end</span><span class="p">];</span>
    <span class="n">push</span><span class="o">!(</span>test_string, review<span class="o">)</span>
    <span class="c1">#after adding reviews and labels in their respective arrays.</span>
    <span class="c1">#I&#39;ll perform pre-processing on individual reviews.</span>
    <span class="n">review_sd</span> <span class="o">=</span> <span class="n">StringDocument</span><span class="p">(</span><span class="n">review</span><span class="p">)</span>
    
    <span class="n">remove_corrupt_utf8</span><span class="o">!(</span>review_sd<span class="o">)</span>
    <span class="n">stem</span><span class="o">!(</span>review_sd<span class="o">)</span>
    <span class="n">remove_case</span><span class="o">!(</span>review_sd<span class="o">)</span>
    <span class="c1">#remove_indefinite_articles!(review_sd)</span>
    <span class="c1">#remove_definite_articles!(review_sd)</span>
    
    <span class="k">if</span> <span class="n">label</span> <span class="o">==</span> <span class="s2">&quot;__label__2&quot;</span>
        <span class="n">should_be</span> <span class="o">=</span> <span class="s2">&quot;+ve&quot;</span>
    <span class="k">else</span>
        <span class="n">should_be</span> <span class="o">=</span> <span class="s2">&quot;-ve&quot;</span>
    <span class="n">end</span>
    
    <span class="n">pred</span> <span class="o">=</span> <span class="n">sent</span><span class="p">(</span><span class="n">review_sd</span><span class="p">)</span>
    
    <span class="k">if</span> <span class="n">pred</span> <span class="o">&gt;=</span> <span class="mf">0.5</span>
        <span class="n">pred_be</span> <span class="o">=</span> <span class="s2">&quot;+ve&quot;</span>
    <span class="n">elseif</span> <span class="n">pred</span> <span class="o">&lt;</span> <span class="mf">0.5</span>
        <span class="n">pred_be</span> <span class="o">=</span> <span class="s2">&quot;-ve&quot;</span>
    <span class="n">end</span>
    
    <span class="k">if</span> <span class="n">pred_be</span> <span class="o">==</span> <span class="s2">&quot;+ve&quot;</span> <span class="o">&amp;&amp;</span> <span class="n">should_be</span> <span class="o">==</span> <span class="s2">&quot;+ve&quot;</span>
        <span class="n">tru_pos</span> <span class="o">+=</span> <span class="mi">1</span>
    <span class="n">elseif</span> <span class="n">pred_be</span> <span class="o">==</span> <span class="s2">&quot;-ve&quot;</span> <span class="o">&amp;&amp;</span> <span class="n">should_be</span> <span class="o">==</span> <span class="s2">&quot;-ve&quot;</span>
        <span class="n">tru_neg</span> <span class="o">+=</span> <span class="mi">1</span>
    <span class="n">elseif</span> <span class="n">pred_be</span> <span class="o">==</span> <span class="s2">&quot;-ve&quot;</span> <span class="o">&amp;&amp;</span> <span class="n">should_be</span> <span class="o">==</span> <span class="s2">&quot;+ve&quot;</span>
        <span class="n">fal_pos</span> <span class="o">+=</span> <span class="mi">1</span>
    <span class="n">elseif</span> <span class="n">pred_be</span> <span class="o">==</span> <span class="s2">&quot;+ve&quot;</span> <span class="o">&amp;&amp;</span> <span class="n">should_be</span> <span class="o">==</span> <span class="s2">&quot;-ve&quot;</span>
        <span class="n">fal_neg</span> <span class="o">+=</span> <span class="mi">1</span>
    <span class="n">end</span>
    
<span class="n">end</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">

<div class="output_subarea output_text output_error">
<pre>
BoundsError: attempt to access 32×5000 Array{Float32,2} at index [Base.Slice(Base.OneTo(32)), 5001]

Stacktrace:
 [1] throw_boundserror(::Array{Float32,2}, ::Tuple{Base.Slice{Base.OneTo{Int64}},Int64}) at .\abstractarray.jl:538
 [2] checkbounds at .\abstractarray.jl:503 [inlined]
 [3] _getindex at .\multidimensional.jl:669 [inlined]
 [4] getindex at .\abstractarray.jl:981 [inlined]
 [5] embedding(::Array{Float32,2}, ::Array{Float64,1}) at C:\Users\shekh\.julia\packages\TextAnalysis\pcFQf\src\sentiment.jl:27
 [6] (::TextAnalysis.var&#34;#24#25&#34;{Dict{Symbol,Any}})(::Array{Float64,1}) at C:\Users\shekh\.julia\packages\TextAnalysis\pcFQf\src\sentiment.jl:40
 [7] get_sentiment(::TextAnalysis.var&#34;#26#27&#34;, ::Array{String,1}, ::Dict{Symbol,Any}, ::Dict{String,Any}) at C:\Users\shekh\.julia\packages\TextAnalysis\pcFQf\src\sentiment.jl:59
 [8] (::TextAnalysis.SentimentModel)(::Function, ::Array{String,1}) at C:\Users\shekh\.julia\packages\TextAnalysis\pcFQf\src\sentiment.jl:87
 [9] SentimentAnalyzer at C:\Users\shekh\.julia\packages\TextAnalysis\pcFQf\src\sentiment.jl:103 [inlined] (repeats 2 times)
 [10] top-level scope at .\In[33]:28</pre>
</div>
</div>

</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>Ahh! Finally it's complete.</p>
<p>We get <code>BoundsError: attempt to access 32×5000 Array{Float32,2} at index [Base.Slice(Base.OneTo(32)), 5001]</code> error however on seeing this issue on TextAnalysis package.</p>
<blockquote><p>Ref:<a href="https://github.com/JuliaText/TextAnalysis.jl/issues/160">BoundsError in sentiment analysis</a>
I've decided to ignore it. Let's get on towards calculating our predictions metrices: Precision / F1Score / Recall.</p>
</blockquote>

</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>{% raw %}
$$P = \frac{T_p}{T_p+F_p}$$
{% endraw %}</p>

</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>{% raw %}
$$R = \frac{T_p}{T_p + F_n}$$
{% endraw %}</p>

</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<p>{% raw %}
$$ F1 = \frac{2 \cdot P\cdot R}{P+ R} $$
{% endraw %}</p>

</div>
</div>
</div>
<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h3 id="Precision">Precision<a class="anchor-link" href="#Precision"> </a></h3>
</div>
</div>
</div>
    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">precision</span> <span class="o">=</span> <span class="n">tru_pos</span> <span class="o">/</span> <span class="p">(</span><span class="n">tru_pos</span> <span class="o">+</span> <span class="n">fal_pos</span><span class="p">)</span>
<span class="n">println</span><span class="p">(</span><span class="s2">&quot;Precision is $precision&quot;</span><span class="p">)</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">

<div class="output_subarea output_stream output_stdout output_text">
<pre>Precision is 0.583117838593833
</pre>
</div>
</div>

</div>
</div>

</div>
    {% endraw %}

    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">recall</span> <span class="o">=</span> <span class="n">tru_pos</span> <span class="o">/</span> <span class="p">(</span><span class="n">tru_pos</span> <span class="o">+</span> <span class="n">fal_neg</span><span class="p">)</span>
<span class="n">println</span><span class="p">(</span><span class="s2">&quot;Recall is $recall&quot;</span><span class="p">)</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">

<div class="output_subarea output_stream output_stdout output_text">
<pre>Recall is 0.5144996465068449
</pre>
</div>
</div>

</div>
</div>

</div>
    {% endraw %}

    {% raw %}
    
<div class="cell border-box-sizing code_cell rendered">
<div class="input">

<div class="inner_cell">
    <div class="input_area">
<div class=" highlight hl-ipython3"><pre><span></span><span class="n">f1score</span> <span class="o">=</span> <span class="p">(</span><span class="mi">2</span> <span class="o">*</span> <span class="n">precision</span> <span class="o">*</span> <span class="n">recall</span><span class="p">)</span> <span class="o">/</span> <span class="p">(</span><span class="n">precision</span> <span class="o">+</span> <span class="n">recall</span><span class="p">)</span>
<span class="c1">#f1score is from 0 --&gt; 1</span>
<span class="n">println</span><span class="p">(</span><span class="s2">&quot;F1Score is $f1score.&quot;</span><span class="p">)</span>
</pre></div>

    </div>
</div>
</div>

<div class="output_wrapper">
<div class="output">

<div class="output_area">

<div class="output_subarea output_stream output_stdout output_text">
<pre>F1Score is 0.5466638895622987.
</pre>
</div>
</div>

</div>
</div>

</div>
    {% endraw %}

<div class="cell border-box-sizing text_cell rendered"><div class="inner_cell">
<div class="text_cell_render border-box-sizing rendered_html">
<h2 id="End-of-Report">End of Report<a class="anchor-link" href="#End-of-Report"> </a></h2>
</div>
</div>
</div>
</div>
 
