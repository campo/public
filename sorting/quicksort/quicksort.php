<?php

/*
// Josh Campoverde
// joshcampoverde@gmail.com
// October 13, 2010
//
// Quicksort
// Worst case performance: O(n^2)
// Best case performance: O(n*log(n))
// Average case performance: O(n*log(n))
// Worst case space complexity: O(n)
// Wikipedia link: http://en.wikipedia.org/wiki/Quicksort
*/

// tested and functional
function quicksort($array)
{
    if (count($array) <= 1)
    {
        return $array;
    }

    $smaller = array();
    $larger = array();
    $pivotIndex = rand(0, count($array) - 1);
    $pivot = $array[$pivotIndex];
    unset($array[$pivotIndex]);
    $pivotArray = array($pivot);

    foreach ($array as $element)
    {
        $currentValue = $element;

        if ($currentValue <= $pivot)
        {
            $smaller[] = $currentValue;
        } else {
            $larger[] = $currentValue;
        }
    }

    return array_merge(quicksort($smaller), $pivotArray, quicksort($larger));
}

// Very basic test code
// $array = array(-3,100,0,0,0,0,-4,2,1,998,5);
// $sortedArray = quicksort($array);

// print "Unsorted array:\n";
// print_r($array);
// print "\n";
// print "Sorted array:\n";
// print_r($sortedArray);
?>
