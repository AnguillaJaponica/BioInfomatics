def hamming_match(seq, primer)
  number = -1
  min_distance = primer.size

  for i in 0..seq.size - primer.size
    temp_seq = seq[i, primer.size]
    distance = 0

    for j in 0..primer.size - 1
      if primer[j] != temp_seq[j]
        distance = distance + 1
      end
    end

    if (distance < min_distance)
      number = i
      min_distance = distance
    end
  end

  if min_distance <= 3
    return number
  else
    return -1
  end
end

def extract_amplified_region(l1primer, h1primer, input, output)

  while line = input.gets
    seq = input.gets.chomp
    l1_position = hamming_match(seq, l1primer)
    h1_position = hamming_match(seq, h1primer)

    if (l1_position >= 0 && h1_position >= 0)
      l1_position = l1_position + l1primer.size
      h1_position = h1_position - 1
      insertion_size = h1_position - l1_position + 1

      if (insertion_size > 0)
        output.puts line
        output.puts seq[l1_position..h1_position]
      end
    end
  end
end

L1_primer = "GTCGGTAAAACTCGTGCCAGC"
H1_primer = "CAAACTGGGATTAGATACCCCACTATG"

input_file = File.new("input.fasta", "r")
output_file = File.new("output.fasta", "w")
extract_amplified_region(L1_primer, H1_primer, input_file, output_file)
input_file.close
output_file.close
