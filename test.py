import argparse
import os

# Parse some test arguments
parser = argparse.ArgumentParser()
parser.add_argument("--seed", type=int, default=1,
        help="seed of the experiment")
parser.add_argument("--exp-name", type=str, default=os.path.basename(__file__).rstrip(".py"),
        help="the name of this experiment")
args = parser.parse_args()

# Generate some test text output files
text_file = open("name_{}_seed_{}.txt".format(args.exp_name, args.seed), "w")
n = text_file.write("Testing {}, experiment name {}".format(args.seed, args.exp_name))
text_file.close()