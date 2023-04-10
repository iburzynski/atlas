{-# LANGUAGE DataKinds       #-}
{-# LANGUAGE TemplateHaskell #-}
{-|
Module      : GeniusYield.OnChain.TestToken.Compiled
Copyright   : (c) 2023 GYELD GMBH
License     : Apache 2.0
Maintainer  : support@geniusyield.co
Stability   : develop

-}
module GeniusYield.OnChain.TestToken.Compiled (
    originalTestTokenPolicy,
) where

import           PlutusLedgerApi.V2

import qualified PlutusTx

import           GeniusYield.OnChain.TestToken

originalTestTokenPolicy
    :: Integer          -- ^ count
    -> TokenName        -- ^ token name (e.g. @GOLD@)
    -> TxOutRef         -- ^ utxo to base token on
    -> SerialisedScript
originalTestTokenPolicy count tn utxo = serialiseCompiledCode
    $ $$(PlutusTx.compile [|| mkTestTokenPolicy ||])
    `PlutusTx.applyCode`
     PlutusTx.liftCode count
    `PlutusTx.applyCode`
     PlutusTx.liftCode tn
    `PlutusTx.applyCode`
     PlutusTx.liftCode utxo
