defmodule ProteinTranslation do
  @doc """
  Given an RNA string, return a list of proteins specified by codons, in order.
  """
  @spec of_rna(String.t()) :: { atom,  list(String.t()) }
  def of_rna(rna) do
    Regex.scan(~r/.../, rna)
    |> List.flatten
    |> Enum.reduce_while({:ok,[]},
      fn(x,{a, acc})-> 
        case of_codon(x) do
          {:ok,"STOP"} -> {:halt, {:ok, acc}}
          {:ok,protein} -> {:cont, {:ok, acc ++ [protein]}}
          {:error,_} -> {:halt, {:error, "invalid RNA"}}
        end
      end)
  end

  @doc """
  Given a codon, return the corresponding protein

  UGU -> Cysteine
  UGC -> Cysteine
  UUA -> Leucine
  UUG -> Leucine
  AUG -> Methionine
  UUU -> Phenylalanine
  UUC -> Phenylalanine
  UCU -> Serine
  UCC -> Serine
  UCA -> Serine
  UCG -> Serine
  UGG -> Tryptophan
  UAU -> Tyrosine
  UAC -> Tyrosine
  UAA -> STOP
  UAG -> STOP
  UGA -> STOP
  """
  @spec of_codon(String.t()) :: { atom, String.t() }
  def of_codon(codon) do
    case codon do
      "AUG" -> {:ok, "Methionine"}
      "UGG" -> {:ok, "Tryptophan"}
      w when w in ["UGU","UGC"] -> {:ok, "Cysteine"}
      w when w in ["UUA","UUG"] -> {:ok, "Leucine"}
      w when w in ["UUU","UUC"] -> {:ok, "Phenylalanine"}
      w when w in ["UCU","UCC","UCA","UCG"] -> {:ok, "Serine"}
      w when w in ["UAU","UAC"] -> {:ok, "Tyrosine"}
      w when w in ["UAA","UAG","UGA"] -> {:ok, "STOP"}
      _ -> {:error, "invalid codon"}
    end 
  end
end

