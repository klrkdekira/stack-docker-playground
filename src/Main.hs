module Main where

import Control.Applicative
import Control.Monad (unless)
import Options

data MainOptions = MainOptions
  { optFile :: String }

instance Options MainOptions where
  defineOptions = pure MainOptions
    <*> simpleOption "file" "" "File to read"

main :: IO ()
main = runCommand $ \opts args -> do
  let file = optFile opts in
    if file /= ""
       then putStrLn file
       else putStrLn "failed"
