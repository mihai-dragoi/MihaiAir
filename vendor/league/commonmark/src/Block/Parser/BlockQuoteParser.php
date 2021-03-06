<?php

/*
 * This file is part of the league/commonmark package.
 *
 * (c) Colin O'Dell <colinodell@gmail.com>
 *
 * Original code based on the CommonMark JS reference parser (http://bitly.com/commonmarkjs)
 *  - (c) John MacFarlane
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace League\CommonMark\Block\Parser;

use League\CommonMark\Block\Element\BlockQuote;
use League\CommonMark\ContextInterface;
use League\CommonMark\Cursor;

class BlockQuoteParser extends AbstractBlockParser
{
    /**
     * @param ContextInterface $context
     * @param Cursor $cursor
     *
     * @return bool
     */
    public function parse(ContextInterface $context, Cursor $cursor)
    {
        if ($cursor->getFirstNonSpaceCharacter() !== '>') {
            return false;
        }

        $cursor->advanceToFirstNonSpace();
        $cursor->advance();
        if ($cursor->getCharacter() === ' ') {
            $cursor->advance();
        }

        $context->addBlock(new BlockQuote());

        return true;
    }
}
